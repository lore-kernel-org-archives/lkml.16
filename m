Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ACF28D85D;
	Wed,  4 Jun 2025 09:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030165; cv=none; b=eLdVG/C3oBSvsEwRK/CvCsf78/78N7olfWJVV2Q1tDddcWd4wAu9+5Y8ndjG6K3MwDjiQ6oXeBq9ThIPbZzKjOxW+Wdw9XOpmsY1JG7bDEnZ0czWesLTGKJga9UwYtm9vvL5xF6JsYxBu5b+hLaEFUMSVJD8WWqbeV75vQdM3ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030165; c=relaxed/simple;
	bh=D8OKWJoLJ58QwTOYJqEgpkuMo+MEWMkMK7eLhXUSZtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uGkSBtMVRpa/mpX9nF4G6sOTpKEw3EvhJxWm3p8vowTT1D02/57wTrKCen8isfdHzVraAQPA/nz6DKAPW5DsGsjDwd0jY04M+th0ev+uwvGC5U3z5efRkt5cAPhvWftV/oIvm0vCFsTdAWiOCcXesWairRa6l19m/vWWQvqnQC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLAZSPCP; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLAZSPCP"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad8826c05f2so1168254266b.3;
        Wed, 04 Jun 2025 02:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749030162; x=1749634962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0jtCfIIjTAAF0Gp3wcFOKteT/tqupCGmuR5iFmShrE=;
        b=MLAZSPCPIVgn1Q/iBLYZhDBw3tA2dL18twbjWJSILMHdviVGA3QkpSUz6IWojUW8sO
         cTbwa3LS+Uz2tU2aYCZfEPMIb/XmmbtOZu3s0iDM3iMFMr6RZ0YLdkINTc3JShZ6M4Eq
         kbLUoJnvMcdtrwMMCLl+E579xa1q4c/Wb35bSs1Kymgos+pQqAP6VMzq99h6rkSsd4xQ
         1kn8BajV9wtRUslNMKv4eOXv0fATmmW2E9UQ2XG6Mcj1tjS1s5XiZBM9ym01+Owux4LU
         Oz1Ie42hlo0ArBcZEsJVJqv5uoeFshPIKzvSVLo1gF4FZJGv7GLejv6XGGglhCyLv1GH
         jYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030162; x=1749634962;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c0jtCfIIjTAAF0Gp3wcFOKteT/tqupCGmuR5iFmShrE=;
        b=vt2KF7prj10mEuXqNLOSUDDqyDiKSY/mZeyAcamsSP2XDgcBPGcYQVRJMOB1HBGZAZ
         KUC+LfVmxPXm9VlWyqb3UT5cGWHq9fJoiPPBiIloLvEu9dobSzVbfVWQYNGP+Bwzn0G6
         N36DBEw/lb4ZuDY6T2XZWmey53xEQpNW4suyfwyI24dNzVXqR//WN7dwqO3GptOwewDU
         Au2MdE0U9/BZCBMIkY9tqYn567lfsUwPrpg6Fm17PWkCvXdwEbbYm2JQT9mPfGvf8yv6
         7YOLtbn05Xco29a4UCF7Yemt2tInvRESohozVP9o/F9MTOSzgsqdCs2S/b+OIVgHE6+A
         a8BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuGoQHlr/FqLXEb03CDdnimoOCvQurn40UdWOVK3h5ANmE5PDrVTNDsSrJ8EdAjfpH1SQSPPEGOn+IzJM=@vger.kernel.org, AJvYcCWX4qmrr4m7cIossbI2jVwcK17pKZzrnlpYh8MlkHlOL/Xn+FJ+9o9ei7H1Ze6CpTka7k9h5q5FzZEUHh2vZ8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlMLjAaZ7Dw/X5FC/H797lheudq3dq5+NwZS/FMnGrBiAXO/IT
	sgE/sFxnsi9QZIt5/6W3gr6S/SPdz8VPQZ11Bl5UyHE0mLk2BgWT5oAR
X-Gm-Gg: ASbGncv69Lf2kzsTugJak4GmZ7w/wrZLsA+i2z7UDbt0Dm5g0D5D907cyZsXsutFLbD
	GljE519kTYcr7uPwWVPi0VvwdHgPho7C2jVl8y2z7bj0b7RSMrhkwY2dHkXcddzjU44wdXBUJ0N
	g0cPeIBoRHl7czd4KaYhj8f2qiRmCt/wvpO69y6ShodZQEtWvDAUsnf4Z5gyJSSmfseJeTpI4CX
	UB5hVbJbuXCxTicK7O1qakkW/UWczxFvKadtAPAZ8yE8uCJIa5YFzB+NAm2cBTaxNDUH/v4gRtg
	Jh6B8RlJGpNtAYuMCMZsnE8XnYbZ97A0BeMbkHCUfiGixuoEa0PHUz5CRev0oAHVClmnh54=
X-Google-Smtp-Source: AGHT+IHG/MDslCkGUQe9REh1rBX42vN1K0U5ws1erjdOsziToZw2BgcDONkU1dbDpYAKs0RVrWNTow==
X-Received: by 2002:a17:907:3c8f:b0:ad4:d00f:b4ca with SMTP id a640c23a62f3a-addf8fcf97amr166877966b.50.1749030161379;
        Wed, 04 Jun 2025 02:42:41 -0700 (PDT)
Received: from [10.5.1.156] ([193.170.134.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3952esm1074985066b.126.2025.06.04.02.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 02:42:41 -0700 (PDT)
Message-ID: <311a3039-286a-49e6-b47a-75f5a173e922@gmail.com>
Date: Wed, 4 Jun 2025 11:42:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] rust: miscdevice: add additional data to
 MiscDeviceRegistration
To: Alice Ryhl <aliceryhl@google.com>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com>
 <20250530-b4-rust_miscdevice_registrationdata-v4-2-d313aafd7e59@gmail.com>
 <DAACCYW3QRQE.1O75L2SHJYVPM@kernel.org>
 <3eef5777-9190-4782-8433-7b6ad4b9acd3@gmail.com>
 <aEAUlvPbX9vFWhdI@google.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <aEAUlvPbX9vFWhdI@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.06.25 11:40 AM, Alice Ryhl wrote:
> On Mon, Jun 02, 2025 at 11:16:33PM +0200, Christian Schrefl wrote:
>> On 31.05.25 2:23 PM, Benno Lossin wrote:
>>> On Fri May 30, 2025 at 10:46 PM CEST, Christian Schrefl wrote:
>>>> +        unsafe { core::ptr::drop_in_place(self.data.get()) };
>>>>      }
>>>>  }
>>>>  
>>>> @@ -109,6 +135,13 @@ pub trait MiscDevice: Sized {
>>>>      /// What kind of pointer should `Self` be wrapped in.
>>>>      type Ptr: ForeignOwnable + Send + Sync;
>>>>  
>>>> +    /// The additional data carried by the [`MiscDeviceRegistration`] for this [`MiscDevice`].
>>>> +    /// If no additional data is required than the unit type `()` should be used.
>>>> +    ///
>>>> +    /// This data can be accessed in [`MiscDevice::open()`] using
>>>> +    /// [`MiscDeviceRegistration::data()`].
>>>> +    type RegistrationData: Sync;
>>>
>>> Why do we require `Sync` here?
>>
>> Needed for `MiscDeviceRegistration` to be `Send`, see response above.
> 
> Even if `MiscDeviceRegistration` is non-Send, the registration data must
> still be Sync. The f_ops->open callback can *always* be called from any
> thread no matter what we do here, so the data it gives you access must
> always be Sync no matter what.

Right I meant to write `Sync` sorry.

Cheers
Christian
