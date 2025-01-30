Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC811E0DD8
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738237900; cv=none; b=qUnUSXtqqZVdPuQ8XudK1BYGcTG18qZnx1Sf+MIWVzJlZy/eO+f4AcgVH4seYyJz2aCyiydm5TCDXzUI8ZQANr1hMcf98Y8xnK3ymYSXkuAekg017hJuH7EUAAJlRj86N0MyLAKHotvPlzgBv8lgOgSM0LM+GcBmN64o53JLvJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738237900; c=relaxed/simple;
	bh=kGp2+R8eNNhmvEcrIQ7enrgR9LeawhDbjVgF/jZ7XEA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nXz5Ae/EURIToAvcEu4tyYauMBzIXDElS+4sXd/tBF/O6i7wOIIoI/ofSAuSZlpEsNrERQA20oXzo22GiPHgph0L9CBpx8/FyUXrvIMwaa1LcNWkq5uzBggdYEGfbIOnyH2/kB/r5DqUIbwav0tBDgLTYn+V5rDcQBHdalMsvCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0KyyF2ZT; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0KyyF2ZT"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3862d161947so369971f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738237896; x=1738842696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGp2+R8eNNhmvEcrIQ7enrgR9LeawhDbjVgF/jZ7XEA=;
        b=0KyyF2ZTXtAliCYtKppP1UDT1DstkB9PA/ygWeChsBSCiAhfaYBx4Il0htF+se9BS8
         iRGuOkSBAXRGUtDJuOvNa9qg79TcqrAIlfnhz/XK7/3sJCle1D4b1V+YCvOzwJpFI/MN
         nd1IiguCrJ0FYlpv9nCPYY+k+QMACHmyn5ElOBpe+Crhyfdx6YR291np4pS0uW9f4utF
         qCRuIMwIhYeScQgyKznx9ZkIQhhxN/+J866DCKQOxyxbIm+b7zb9WQBm4UQ8EXJi5maZ
         iUxopc8drWhzLONtbcIKNH+llSLtH5EnbRdujCHgV2NcXIdtF0C7xPz579JEJQvNwPtw
         Tymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738237896; x=1738842696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGp2+R8eNNhmvEcrIQ7enrgR9LeawhDbjVgF/jZ7XEA=;
        b=gbCpj0sTeSG0SiTQvXiDvduGzUrSfvDIFW3rr0uqPwgmO1WIUjVjCsSSpyv6OgUhuW
         HFn0FyMr/fRL6404rRzQWYfPynw993Sy8x0wC9s9T4VsacDS1oefepumHxosHy4oyrL7
         2BwGfJku1LRx3nH5XXclHgI3gl4OcXV9f7zKVl+3pPYFStO201tpewLTJhIWBH4DsncB
         NHqb1Tv8i9bYE4qY6f+9dP+rOW80QPICBxjQgOQ2IE5TrHq4zhDrnHaJAbfQI+ZRgccB
         N2xWkHmWhqFtgVOYF2NuZKHFx05kdTFgZJbnAb2wHVS3EHl2FNAwLJPBU2303Xcwch3b
         Onew==
X-Forwarded-Encrypted: i=1; AJvYcCVFoVM0BhhLGBdey7b3i0rgb9OVRkBRG70BIl04AANlGyj0xLjkqHqsjAk90w6AIcIdlk17Noz1Njxqt2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrxahBE2UhJGAtwVWcLwC9Bhp7/y2Up2zwmRFBa+qc86By6wA3
	lvJ1vV4JMZm6T6rpH+Rt/xplQxvG7/QSlCmBBViQSB+XNpnXD8lYaKBuKGRDmfuFHW5OZ4H9wS2
	WDSlyPcAaBeM5oHm+alQFnjIqksmzLq6oVQYs
X-Gm-Gg: ASbGncsyTj4JEs353EN2msCEprHnNLoDFUVEttvJhuvn6ODGeVPcIO0ZlkDXSWbx8EB
	6Kwr9Z+Etsn6xiu4LCBSFqV1KQkXsfg0XIFQ/5JOu4CyJb1NqcgmbPX7YHiRQOcxfRQaOU3fexx
	shXdvjjEgNA3Xb8i7XZl5az7hFfeQ=
X-Google-Smtp-Source: AGHT+IGvhsMDfSw2waYNiEI+BbQj09q1Fmdbt3AaOePv6Ibw4RBOxEFXo20jAmJyvPKbzZHhQGA6ztql9g5ekL72F2A=
X-Received: by 2002:a5d:6d0b:0:b0:38a:8647:3dac with SMTP id
 ffacd0b85a97d-38c520940bcmr5783375f8f.34.1738237896495; Thu, 30 Jan 2025
 03:51:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122131812.466080-1-anisse@astier.eu> <20250122133952.501055-1-anisse@astier.eu>
In-Reply-To: <20250122133952.501055-1-anisse@astier.eu>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 30 Jan 2025 12:51:24 +0100
X-Gm-Features: AWEUYZl8PktkmFWhIXon5Mf7gRkSIqN3HjonYckcGOQRDHSq3NA66Ohjeks3P0k
Message-ID: <CAH5fLggCtpLJhh7eD+kaM-e54=wCHFVJU9drmZuZ=kaKvzEQ6g@mail.gmail.com>
Subject: Re: [PATCH v2] rust: macros: enable use of hyphens in module names
To: Anisse Astier <anisse@astier.eu>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 2:39=E2=80=AFPM Anisse Astier <anisse@astier.eu> wr=
ote:
>
> Some modules might need naming that contains hyphens "-" to match the
> auto-probing by name in the platform devices that comes from the device
> tree.
>
> But rust identifiers cannot contain hyphens, so replace the module name
> by an underscore anywhere we'd use it as an identifier.
>
> Signed-off-by: Anisse Astier <anisse@astier.eu>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
