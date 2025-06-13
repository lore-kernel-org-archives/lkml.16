Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34504A29;
	Fri, 13 Jun 2025 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820219; cv=none; b=CPCMpdl5HpffhFCUsaQyQslfh3EH7fPK53hN3WDv/KMrYPztLcu8Jxb3EwS0AJqe9HX5j8uFRWw0KvDajMjdKaZnSRwXRXW8TmC19gkPWKGPD2TeWYBU3JLsap1ZYsJcOuFaYvVFKAZmjb2ODfWEYve9FAJ24Z4qGupaKSX7Jdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820219; c=relaxed/simple;
	bh=ri5ndiBUENKgqpmMgaglIF1RnBdDS73JLM7+653Ze2w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NzkA9HR6jigSRx2aVOKHyq8tr/394x74MuKrp2+5tVjZX4OFsaF6L1dhLD5YoCWeVmp6SdydZO8o7nOwIuyGl0o9OLNWfiRX+QcYCRw/5Cnff087VaDgDUFa5Q71qi1VivF8bAo05jRsTKjV2aVDnxcFccmb566z9eeZjKtRK4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e56n0mrM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e56n0mrM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67851C4CEE3;
	Fri, 13 Jun 2025 13:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749820218;
	bh=ri5ndiBUENKgqpmMgaglIF1RnBdDS73JLM7+653Ze2w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=e56n0mrM0NS66KDGywL3MWDqsT+E2fdGP3Zqpg+Bh/zEEk4rT8L2WV+7Hlb6LVpiq
	 WdsHf9YMAhSkgI9U7gY56gJLZoh9NL4Q/5GGPOQy3L1qVn/4MrKvKgq880StlsQtCT
	 KFJvtimV8CKnGfkOkRxWVJsFASPal4eVePiun/iMDxOX4gQTGH0B1xcdbDa8UBBhJt
	 mscRADmphte3cK9xBYr8J1qEwQG13n2Jo/lXbk7TB8YJWhwnFTUiuIFSJiA+Qv1S7s
	 tXkUttq6II+mT8GtWIuEDMve6wJCw3aQ41XEasXJuyQUi2NtkuijoqB9VDdOR1mJQq
	 ED1RBDcyWfN7Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Oliver Mangold <oliver.mangold@pm.me>
Cc: Miguel Ojeda <ojeda@kernel.org>,  Alex Gaynor <alex.gaynor@gmail.com>,
  Boqun Feng <boqun.feng@gmail.com>,  Gary Guo <gary@garyguo.net>,
  =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>,  Benno Lossin
 <benno.lossin@proton.me>,  Alice Ryhl <aliceryhl@google.com>,  Trevor
 Gross <tmgross@umich.edu>,  Asahi Lina <lina@asahilina.net>,
  rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/5] New trait OwnableRefCounted for ARef<->Owned
 conversion.
In-Reply-To: <20250502-unique-ref-v10-0-25de64c0307f@pm.me> (Oliver Mangold's
	message of "Fri, 02 May 2025 09:02:22 +0000")
References: <20250502-unique-ref-v10-0-25de64c0307f@pm.me>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 13 Jun 2025 15:10:10 +0200
Message-ID: <87msabbxe5.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Oliver,

Oliver Mangold <oliver.mangold@pm.me> writes:

> This allows to convert between ARef<T> and Owned<T> by
> implementing the new trait OwnedRefCounted.
>
> This way we will have a shared/unique reference counting scheme
> for types with built-in refcounts in analogy to Arc/UniqueArc.
>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>

Do you intend to send a new version of the series?


Best regards,
Andreas Hindborg



