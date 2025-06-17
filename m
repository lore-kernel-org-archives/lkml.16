Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C218528E;
	Tue, 17 Jun 2025 08:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750147591; cv=none; b=YQ6rE8Msl6rj+QUj6VEwOECByV/d3Nn234V8NRZlXIxJ8xz64oD9Sp6ukLRn7qnpJRgQzZIxCRvDpcGSgJJzL/GopBd5sW0j3vq8QEG5kG4KK2eeYQhR9Hv9HJdWjf0UAChHjD+Vd+g/qw5Nxd5mESZr6DzGLEBCjsTfy/vBMLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750147591; c=relaxed/simple;
	bh=hsFwxEVO9Rp0Gs4tjiiIcsWBbo6X8OFvvzR0VNqpiiU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UrcpHCa/LNrUbGM4wxzeWsE9y6IvKPAFcDDMLn/87iJ/PdEIoMstNJaEwNAtfFMiF4VnGVLCFBCcQrfvHBjtExoKfVJZzSNEk0xD6gpewnUIRf5ROAp/1hMd35tx3U1sFMc3qO5cJxjJvLj6/qh5fCr+M5SjZt0p7L2UiLmJSUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2yX50OH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2yX50OH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA55C4CEE3;
	Tue, 17 Jun 2025 08:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750147591;
	bh=hsFwxEVO9Rp0Gs4tjiiIcsWBbo6X8OFvvzR0VNqpiiU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=B2yX50OHXwC3QrONRJkmgryA8PQSWj2BCJoMDBrTI6mic0Zw2zlJtthXHEfXWmUEq
	 GiM+1dNtOvWk4WNmiF+u3A9K9+AiNMLZnf7j0OhbeRtif/sYHmPEqodJahcFFqnrGO
	 00wUSYsRXDRpyu0+ergQHnNcPL8YqFfYLZwdSYuRDQeapyOanq55Acq2Eja/WeqWho
	 w/IxKl783DptNutv4ldwFs1UOXV3CmbOzFR59FA/2QHtAhy9LmWmBusvTmN7PW2vYX
	 pYBUyrVGSRClFCjlJ7RBgomgtjgGDMeZNFqWP+mC+T8KwfbXcJCfd0wWZsEnWDCUGY
	 k8kJysveo10CQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "FUJITA Tomonori" <fujita.tomonori@gmail.com>
Cc: <alex.gaynor@gmail.com>,  <ojeda@kernel.org>,  <aliceryhl@google.com>,
  <anna-maria@linutronix.de>,  <bjorn3_gh@protonmail.com>,
  <boqun.feng@gmail.com>,  <dakr@kernel.org>,  <frederic@kernel.org>,
  <gary@garyguo.net>,  <jstultz@google.com>,
  <linux-kernel@vger.kernel.org>,  <lossin@kernel.org>,
  <lyude@redhat.com>,  <rust-for-linux@vger.kernel.org>,
  <sboyd@kernel.org>,  <tglx@linutronix.de>,  <tmgross@umich.edu>
Subject: Re: [PATCH v3 0/5] rust: time: Convert hrtimer to use Instant and
 Delta
In-Reply-To: <20250617.070708.74052163124048514.fujita.tomonori@gmail.com>
	(FUJITA Tomonori's message of "Tue, 17 Jun 2025 07:07:08 +0900")
References: <20250610132823.3457263-1-fujita.tomonori@gmail.com>
	<x6cfHAZF-ehcf0crhi8-LYfHLBA7_viOPFSkYml-7j6p6eCL4t-UjrA--fwTbUq1UFX6J7g5igyE2caiXLJNVw==@protonmail.internalid>
	<20250617.070708.74052163124048514.fujita.tomonori@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 17 Jun 2025 10:06:21 +0200
Message-ID: <87h60ebxmq.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Fujita,

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> Andreas, whenever you get a chance, could you create a
> timekeeping-next branch and merge the typed clock sources patchset and
> this?
>
> That would make it easier for me to work on top of them.
>
> Thanks a lot for the review!

I will let you know when I publish timekeeping-next, probably this week.
I applied the patches, but they are currently going through my own
testing.


Best regards,
Andreas Hindborg


