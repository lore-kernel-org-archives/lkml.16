Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606B1258A;
	Fri, 30 May 2025 16:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748623054; cv=none; b=U1ke+qXhqrP4ngHtvGvr/ibeAkfqNTAiuOLdamVOxOMfQM4/l/LjeAEPLQ24RTbmAZXF+9xGbQhLAIep7Nrr84JDWDXb7Dz2iW3slfVNDpgvQstTXXu57XxxNQZnLzAhbyVztRQYE/Hj3+oZRhFM1Q+clTY0ig44ALQDKp0UjTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748623054; c=relaxed/simple;
	bh=6BY3QXNlxopiLNEjgGmB8B+/VPGjyeLNC0mjDcEYpLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fUQXjPLs6QIBH6D1VJR/m6ISzeJzvnEVg+gXfAuaJQ8dMGg6epYYGkw56Mxe6hIdS7FTRMtf9eTkwM8beUlo1blj0L5q7AS/pwejoi1Ip28V8APo+UcyMgwhsXMJoJI/3jyVzXooyhvqeqWZw6uJHZV7poCIpA+N2D9Rc7gDYV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cvIgq7Hd; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cvIgq7Hd"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a3771c0f8cso1399939f8f.3;
        Fri, 30 May 2025 09:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748623050; x=1749227850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wq/nENf0Q6mkXPGRwv59FqaFMWfmfLmkAOhcwSDkq78=;
        b=cvIgq7HdHn/nGfTyVVmigOuHInvycG624Fc2W+mTpc1vlZc5u1dVEBcO82quk12WmN
         tKbyFLERabuBYteJdYeZ0ISjOS2l9DZ753o1j9Z6Rwzb5I9Hrx1NSyVbdQS3L1BcYMmO
         pabiI93XeIVOXOjxvzamFc0r7b+YVXZtgvXau1PTox17IoEusmwNeHUS+Gs6qI7vVKUl
         7aWZbT3mP3vy4SCpWF96v3cAuEN73gcQfAjYdy3sOerYND9ijKgh/KKqP1j/aeCihlC2
         axEL0xg65F69MTw4Flg0XYiZSASsMmGt1XcOvDkW7q55oZQuF7tGck6NoWk99/k6ln6m
         0iSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748623050; x=1749227850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wq/nENf0Q6mkXPGRwv59FqaFMWfmfLmkAOhcwSDkq78=;
        b=Xv8aYjxHHh1HUyBJX9grc37yFMxMJkk9ZE2T+qyoT968yiFPNj/oXxMPyRIFxrkwqe
         ILodLccayznFg9kq23Bqm6GGpdYo1Y7ZrMLznILYkY078+Wq8/1FfqZ3xgE5s05pYqjg
         7ejljPayzSEQNoiTNImxlZ35ntHgx5DwIOd+fOXfx8C+1NUv+0BEzg/49gwRIi6fHXik
         rcDT8Thp3sYW8c/T9qa3gvk5JQ3HD+CQ9hy8qlckc1YrBjvb7G50QmUbn2GTh82l+PNI
         tjywzLB9uNjkK+EaRzysQeyW79+QDBg5ueVsOEVpE0k5pXVc6QAJ60DjyacthvNBiruL
         Bxtg==
X-Forwarded-Encrypted: i=1; AJvYcCXM62M7wOKkoSBS2T9R2wUz3sjWEvi7wrrTjYEdh864F8qRjMWsWcrHYQ2Mb7+RO76WodRdFFZcVch0F+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ8GMoRZR7HaZe0dn/Fo7w5p0vppSwY2HTUDFAVFv9OV/ekGzi
	gFGJd6FLhWVoq1iB1iawKIcPA7K/cf/Ss9oUkkuZAoejL7Nr58m30stR
X-Gm-Gg: ASbGncsrJFQzG81soXaSKpidLqRu6c4R3cZpbrybQqX/rEKLrfZDgqRD1vM1g3BBZll
	4MoV1Rsl7vyIH8vQ5cuuYNwHLlT/yJIgCQBU6O7uMvEUoTijR3Vv8cVupb63yBAsgP4uH9K0MPg
	8Jwvi8JCDMpwt4oh5xg5f4Vnvq9qpbimIN9LfqoV7j+rdnbrglxtmQCdJP/mZw/xm8J4DAWBY0Y
	tuyeqRbzxS7tIt2Chv+zXYGRfUqAB4+jylEPUzeI9Sv9k/JQPJBLSG/AJuExCfHgevqc452O39J
	zclOToiszWet/9UVopaQRHU33uSRVV33ir5gJ4adxx0L8i6vJX1hRvQotyf2ZsIn
X-Google-Smtp-Source: AGHT+IE1EsheEB57t/7PfJFw0kAEmz3VMg6O4HB4sUfVm9QXbk3xpDmlmj+4EDgh8E8qK4AzjM+oTw==
X-Received: by 2002:a05:6000:2485:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3a4f89d354cmr2684099f8f.35.1748623050471;
        Fri, 30 May 2025 09:37:30 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:cd68::171c? ([2001:871:22a:cd68::171c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f1c6sm23127935e9.8.2025.05.30.09.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 09:37:30 -0700 (PDT)
Message-ID: <9e0acb35-7d10-4a8e-b5c6-968d1310146b@gmail.com>
Date: Fri, 30 May 2025 18:37:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] misc device: support device drivers
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
 rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250530142447.166524-1-dakr@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <20250530142447.166524-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Danilo

On 30.05.25 4:24 PM, Danilo Krummrich wrote:
> This patch series adds support for device drivers to the misc device
> abstraction.
> 
> For design details, please see:
>   * patch 5 "rust: miscdevice: properly support device drivers"
>   * patch 6 "rust: miscdevice: expose the parent device as &Device<Bound>"
> 
> This patch series depends on the pin-init series from Benno [1] as well as on
> the misc device series from Christian [2], with UnsafePinned replaced with
> Opaque, as suggested by Alice, since UnsafePinned may still take a while to
> land.

If you want I can send out a new version using `Opaque`.

We could also add a type alias like:

type UnsafePinned<T> = Opaque<T>;

That would then be removed in the `UnsafePinned` patches.
This should make the migration simpler.

Cheers
Christian

> 
> A branch containing this series and its dependencies can be found in [3].
> 
> Thanks to Benno for his great help with pin-init!
> 
> [1] https://lore.kernel.org/rust-for-linux/20250529081027.297648-1-lossin@kernel.org/
> [2] https://lore.kernel.org/lkml/20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com/
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=rust/misc
> 
> Danilo Krummrich (7):
>   rust: types: support fallible PinInit types in Opaque::pin_init
>   rust: revocable: support fallible PinInit types
>   rust: devres: support fallible in-place init for data
>   rust: faux: impl AsRef<Device<Bound>> for Registration
>   rust: miscdevice: properly support device drivers
>   rust: miscdevice: expose the parent device as &Device<Bound>
>   rust: sample: misc: implement device driver sample
> 
>  rust/kernel/devres.rs            |  27 ++-
>  rust/kernel/faux.rs              |   4 +-
>  rust/kernel/miscdevice.rs        | 341 ++++++++++++++++++++++---------
>  rust/kernel/revocable.rs         |   7 +-
>  rust/kernel/types.rs             |   8 +-
>  samples/rust/Kconfig             |   8 +
>  samples/rust/rust_misc_device.rs |  73 +++++--
>  7 files changed, 350 insertions(+), 118 deletions(-)
> 
> 
> base-commit: d5e34ea41dda1500a4dc163d6e96395fe7adc681

