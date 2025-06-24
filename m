Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5E3248F6F;
	Tue, 24 Jun 2025 11:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750763792; cv=none; b=Wh0kB9qO/35+a5UTKBTQOph0TPBGEK1jhKhtguZySCSTTUrBoPQK/n8Cd4ardTsF+0eU+4te+UfP+KaFI2euvypS6wjgkeiAygHQE51RgIg40aTGU9O3b+w2AR2At4KWBPdG/tun5TuILr7vkvHhm+MJS8JePWlClKVR6v+pcX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750763792; c=relaxed/simple;
	bh=8BYFUgQwEpjEYtf8h7c7zmOdfbd6mudHQsmkVjQhN9M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=W2p5scaUXXa5je2nNvQsHvn0fnz4F/+j/fY0S5SjuT2zrYWSzb9Cfr2u9JsgC84ZKkrcmz5XWnDbcutsW3buePBmfrqmVpB5GNWufFfltRv/Z4UPBs0Fnlm9Ehgd0SzY8lpCjL+5p/a908+HZVkQuIevcFbSNnNwWVTXMZr4xuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bOCSk4ap; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bOCSk4ap"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86170C4CEE3;
	Tue, 24 Jun 2025 11:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750763792;
	bh=8BYFUgQwEpjEYtf8h7c7zmOdfbd6mudHQsmkVjQhN9M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bOCSk4aptXpW1fgNeClGLZL7CWggHk5D5U0ltXAbFVmgWbOiqmWyymb4uDPhXT4rp
	 WlNn+J5y0nRpVNfDU8cogrrG24H/boiXnpQ9RrtZonkXcOBx6VrAmVBY7VTKz9b0El
	 q1OpwqldSVVW/rOERKqOeBzrwfLvz2IFRZx0qsUrcj2v6GabtN7WGxHQPEa+7RrrxW
	 pDBhHVNYPV89dhLTqRI5znB5MrPY1ANLYMPSMbElV+dJKpGFVu93spFvxOGhKtm0Kb
	 ZtaTzDVSMBwFgTvZQUKxGr/41rDLnRnwTK1qRrZdkqD/jAFHV8LinhW4GdcimBymyf
	 7OOlsJjrfHsUQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: alex.gaynor@gmail.com
Cc: ojeda@kernel.org,  FUJITA Tomonori <fujita.tomonori@gmail.com>,
  aliceryhl@google.com,  anna-maria@linutronix.de,
  bjorn3_gh@protonmail.com,  boqun.feng@gmail.com,  dakr@kernel.org,
  frederic@kernel.org,  gary@garyguo.net,  jstultz@google.com,
  linux-kernel@vger.kernel.org,  lossin@kernel.org,  lyude@redhat.com,
  rust-for-linux@vger.kernel.org,  sboyd@kernel.org,  tglx@linutronix.de,
  tmgross@umich.edu
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and
 Delta
In-Reply-To: <175015666837.277659.5038961663728008472.b4-ty@kernel.org>
	(Andreas Hindborg's message of "Tue, 17 Jun 2025 12:37:48 +0200")
References: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
	<175015666837.277659.5038961663728008472.b4-ty@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 24 Jun 2025 13:16:20 +0200
Message-ID: <87jz514cfv.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> On Tue, 10 Jun 2025 22:28:18 +0900, FUJITA Tomonori wrote:
>> Convert hrtimer to use `Instant` and `Delta`; remove the use of
>> `Ktime` from the hrtimer code, which was originally introduced as a
>> temporary workaround.
>> 
>> hrtimer uses either an `Instant` or a `Delta` as its expiration value,
>> depending on the mode specified at creation time. This patchset
>> replaces `HrTimerMode` enum with a trait-based abstraction and
>> associates each mode with either an `Instant` or a `Delta`. By
>> leveraging Rust's type system, this change enables `HrTimer` to be
>> statically associated with a specific `HrTimerMode`, the corresponding
>> `Instant` or `Delta`, and a `ClockSource`.
>> 
>> [...]
>
> Applied, thanks!
>
> [1/5] rust: time: Rename Delta's methods from as_* to into_*
>       commit: 2ed94606a0fea693e250e5b8fda11ff8fc240d37

I fixed up the application of this patch in timekeeping-next.


Best regards,
Andreas Hindborg



