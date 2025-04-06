Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F61A930;
	Sun,  6 Apr 2025 14:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743948505; cv=none; b=SpbCvKG674HQkgKG2b1aJjjSUjISmiM846p/1KhRBdREDoE4JPyG73MiNhltDHvA7f9kp2l2yqYzLqwyXgJPZuWwfnvD1P3VE8oGYty9TBcBujCtMFJ1PXODmQy0f55pc2NSo5epSMfRUUPuIf9kPdUAeOKa7bNVqIco6Kt8wEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743948505; c=relaxed/simple;
	bh=NFJzntw16SzoC0742TK/hg9oHHtechyPu4gxi9PpXOk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=lyxi6sKrkid8p7cQS8wSxwtJE7FpD9AZg7eL8Za2YYfhOmb6eAvqt2AYRrZB3eN+NtokjwfKC3C4lLjNtvsTENmm8TuE8eWDgIf4Xxid8GWTOfhg81HiuuCIo5xA9YMlAuS6+0q09CTj3C4elEYrjba025zG4tMIW8nenp2B4Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJRIxJSC; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJRIxJSC"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-477296dce76so31953321cf.3;
        Sun, 06 Apr 2025 07:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743948502; x=1744553302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFJzntw16SzoC0742TK/hg9oHHtechyPu4gxi9PpXOk=;
        b=jJRIxJSCXjOaO8ep3iiB8l+ZZtJAQSyyxMX6Z0F+QQ+QpZuFpgZeIZGfZIdX7bTc8p
         CIIUFFijkSmJuOp/aiYWj0YOjDMPkG557doGhBa0mltiFS7mbz2zRpJTqwU+XW6QsaOz
         /dFlR4H+zrqFa6f7P2+B3/LCmwDulPJOxIE0lV1fMKdqLJ2rulI1PXlSOdASw0B16lBU
         813ELyWJXIfeDgJRSUMm5Ux9cE7kHQpmYSAtFvgaABD89RZ9olg7GLgssACe0p7Z7rst
         ggMNFNwji/1b7eTXkgqF4s/ZoVgLL4HR52Xj3EJRPp5b0/R84HfnAW+QnRqi9QIhivBk
         h4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743948502; x=1744553302;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFJzntw16SzoC0742TK/hg9oHHtechyPu4gxi9PpXOk=;
        b=LO179lbjnmXR2WzV0Qj32ATiouiH1WSDjVtzxPiuzzHnVkpfTEHSm7RlEFLCP4m3WR
         +XSMOKbGoI+APu/YyhCjopy1X0ffqKpW+lg3spWmCIJ4YUJHeej+/ooDA94kriCFJU/Q
         R+Rw7k2Etb/2A+CTvIa6tZScd6vvqUH+Y80C5ROjxJZVnBvJlWLdoA6GsxbWw4tZRl/h
         s1wqtQ65LYiMvSPtrm25OzaoymORSit8NwoX6BrqS/yiEnoFNN5j2EG0KDpfYgJ0G7FZ
         MoB3COuZ/SwoTncsiccJipV9RCADedq2CsL8ZbPhDpAywM2/Tf7NQVDnpG7osulBWh8q
         vU+w==
X-Forwarded-Encrypted: i=1; AJvYcCUAsKp0LVbuGFxxFDDCCvIdAS6NRfBUY5uBLrcm6G0dh8779AmS67G7QO9d4kKOa34hX9YlakzhHhf3QvUfkg0=@vger.kernel.org, AJvYcCVaXdfsUXdKMVWgwI+FDytVbZBckYXtmOV17PjdoTMW3wWJUF0znKw4++6jKfpvZYVukxY69EvXB/U=@vger.kernel.org, AJvYcCWNNMAm1vt1wjOF1emLUlcM/iAr2+IzlrFIiF4uF0AVtn2/QXIqyVBM2xwv6c5dwqhT+Ag4biRSX//1LyxM@vger.kernel.org
X-Gm-Message-State: AOJu0YwF+uIMau4lnaEnA7OzjmjkZNdTqxjC35hUdXLJFbzitl5xtY0j
	HEGUybZgauOUIeREJGFFZ8z2XB69/QWdBP5ndu86eXUtvy6Ly9vK
X-Gm-Gg: ASbGncvj1UcZrDHHIpl1pJn2x24XerBbMjMwAoyqrD6ovBZ9rxwgLZbN3KWNVLhkxMJ
	NI8CyLG82OgYaCDM74AHPba7fWuo++/IRc3dLxa1V1Oz06LQsLqm6Gk60Ex9qdxy/Km02clnWnv
	aw2Y5tTad92JNVpQUtSKNhZcs6gvxfJhmBSP3ZYYMdPZKCxn+wsAil+mITeTjLM9gKgaOVFyEtD
	mxUoe8hb97gwqGs/5P8r7ODor+bBPZcHFJCIVWMSKBORGVK91V7CENI594NzE8w0iw5ny1jXaqe
	fgcZkN9N/ch+I2RSzg71BkdncHAYE/CbAKzw4kegt+UrxQ==
X-Google-Smtp-Source: AGHT+IEUu/+m+XALAP+13peOc7iFxpgjBuow24PD88ZWu9Elv4WYM7GWKb8VhiqJcp3340l/+Tcpag==
X-Received: by 2002:a05:622a:1a27:b0:476:ac03:3c2a with SMTP id d75a77b69052e-4793110f2e3mr84031561cf.43.1743948502417;
        Sun, 06 Apr 2025 07:08:22 -0700 (PDT)
Received: from [192.168.38.58] ([24.35.8.11])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e96cf01sm474436585a.55.2025.04.06.07.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 07:08:22 -0700 (PDT)
Message-ID: <0cc991ff-e0e5-453c-91dd-84710bf7e028@gmail.com>
Date: Sun, 6 Apr 2025 10:08:20 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: chrisi.schrefl@gmail.com
Cc: Jamie.Cunliffe@arm.com, a.hindborg@kernel.org, alex.gaynor@gmail.com,
 aliceryhl@google.com, andrew@lunn.ch, ardb@kernel.org,
 benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 corbet@lwn.net, gary@garyguo.net, guptarud@gmail.com,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, ojeda@kernel.org, rust-for-linux@vger.kernel.org,
 stappers@stappers.nl, thesven73@gmail.com, tmgross@umich.edu
References: <399cceb4-dcf5-4af8-a8b7-6741e9b7e8ae@gmail.com>
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
Content-Language: en-US
From: Manish Shakya <msh.shakya@gmail.com>
In-Reply-To: <399cceb4-dcf5-4af8-a8b7-6741e9b7e8ae@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested with Beaglebone back with following configs:

# zcat /proc/config.gz | grep RUST
CONFIG_RUSTC_VERSION=108600
CONFIG_RUST_IS_AVAILABLE=y
CONFIG_RUSTC_LLVM_VERSION=190107
CONFIG_RUST=y
CONFIG_RUSTC_VERSION_TEXT="rustc 1.86.0 (05f9846f8 2025-03-31)"
CONFIG_HAVE_RUST=y
# CONFIG_RUST_FW_LOADER_ABSTRACTIONS is not set
CONFIG_TRUSTED_FOUNDATIONS=y
# CONFIG_BLK_DEV_RUST_NULL is not set
# CONFIG_RUST_PHYLIB_ABSTRACTIONS is not set
# CONFIG_HID_THRUSTMASTER is not set
# CONFIG_TRUSTED_KEYS is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_RUST_DEBUG_ASSERTIONS=y
CONFIG_RUST_OVERFLOW_CHECKS=y
CONFIG_RUST_BUILD_ASSERT_ALLOW=y

