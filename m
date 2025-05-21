Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851921DE4D3;
	Wed, 21 May 2025 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747838508; cv=none; b=iyCMrr9u2cTe0RaLLmQIGiyHhAwpT9Bw+vjECgcL462z5pSyDo9xOQ7+dDLtBhyUoRMbDkhdO2wOBkZKFCAZrv498WCbTeq4PzJ5/cv4ZFey9Y4OIPuSmZ92ANJ/YN1KhpJSTHWo4PKMCOxYHqVeseiXoO/X2o4HFPKn94u67Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747838508; c=relaxed/simple;
	bh=xGwv8zOnBEuC2KXKMvwIoAf5LhaujZS6kwKCDX9Q3Q8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SPw8oGPPcAJzrEbhad8tnIZnmjRp6esZjzoE8PKukRJbWDlKgtOQ2Cekn4hR4BBzyfgWVmuRNBtirWNEKinzjqtHw8X3jEmS8LiNV+dkihQhu4qBa+pv8OHEq47bfsNNH4QtytEQXwtNMtO41EUZulMdQ8W100eArYwITHXABcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XB/w+SSE; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XB/w+SSE"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acbb85ce788so1342966766b.3;
        Wed, 21 May 2025 07:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747838505; x=1748443305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C1UUJjI6uVedXhjrW1TR558sVBfrP4UvOSPCt6T5RL8=;
        b=XB/w+SSEFYmJW62fhRDvvFvlZCbvFunWoXiiYmEvPkcCkScnmF7LrDHPKYLnZIYUJf
         glDpPc+iVlJU+Aies0Zbld1/rPvYnXxUIah84XGzLHZPRfdwDsysWAa79pWA53/bGc3e
         rh+QXDhyLYR6SlQhr2M/E7bFXxdEi/18bxVn2wNzDmU1rMK/8Veg3SPQtHc3NUCxMBKA
         QbEIdFPPPq1zkOdVxTQNarYTuY+9kYAjuptsLiVZV3h28sva5OrYWv4JmXaqdzJBK648
         z7+OzBYGzeHYio/t+siPcANEJubEsYaTzD9QHw1W5EUMrpUrKogJdgieQVja6LY4Lm7O
         qTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747838505; x=1748443305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C1UUJjI6uVedXhjrW1TR558sVBfrP4UvOSPCt6T5RL8=;
        b=c61khu4I/JRfdO6mRXVuD2i0kthplJXRQnoW0tzYsZB+jm+NiVGz/uj2E3lDYlyRR9
         R0I0sZrbjt3dFZJke3R6Sol8hqPXWFXufgVum7Y/YF8ot167RiIEXoSk/1ZtATMX+QXK
         0Cp7AYhjjV35Pej6JWggqkap158aKiWbrGKkDwCxR7TLJheOkcE9zQRQd+851npXt4Sh
         33H/mkJedovc0DX3VYsMGOG3YhY55nZ10Zn2X9caocVXFl26UNOi7tof5qajtbbVDhuc
         bgBypdVCbUvyZHMtLjFq0+QhuEZM3zx6bCkeM9r9WMOE4OthNNa523AX6kl2XN+YwVzI
         XKzw==
X-Forwarded-Encrypted: i=1; AJvYcCWMyOnp7F1F/5IrkJMtuOIdfsP3VZBa2IkS6+kcWQuAxjB2E5wyQbpx6TJnNpZM+wzSXRj84ixVEEG/Lok=@vger.kernel.org, AJvYcCWtJcUlEFMcD5qOxacG49FBuMfKseSLJwQcqUAmSwjUyuV5PX3miXPLkbJ6rszFDavOk4VbA8L7OL4jv7Uyfwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzculH+YXphrXpQkmt3JkyYnKcXmvxTDiYG0NZ7osALuVkjNMJW
	H0IQnTfm9o4zOsSAoXWGx9iQxArdXGmSIXyyKz3u7TRMmdy0QioHTmpt
X-Gm-Gg: ASbGncvrYQ8yYfjPFUwPxTCLqzyGqtRWAYeBIo49NRrcwyyqXJlc1IuLNgyIV3lJztL
	mm9VVN057uJ8qUmX4xLJ1F2KptdDh8coGlp1sD6Yv3ABFuMHL74mjW+XQS+1yxdNgmjzb4r38lg
	dRjrQD0LUP0KoiN1f+YxBdTJ0kHHNd4V/HxpNvo/BmVxAtZ5VXQFtC9UPVk54j3diaMQz1dzqiU
	gxXjNgByFXv58YPjaY15uFPV0zmP4C1Ii5ebIg71TXTfGknhLBuCl/5sZFdS/zAPnEImFbNBJZM
	iqdTKtoS0SImb82SRfdpITc6zdU3zfU4OGs+pjicywCtbkdiTNVDTlVsRGfw
X-Google-Smtp-Source: AGHT+IHdWUcyjR/eAqavzD2juSux585KrfO0BAvXyaiLmoTl1xqZVtMRB8htIIkLjTQGAHmv4MaEgw==
X-Received: by 2002:a17:907:7fac:b0:aca:c4a6:cd90 with SMTP id a640c23a62f3a-ad52d45accemr1998919366b.5.1747838504367;
        Wed, 21 May 2025 07:41:44 -0700 (PDT)
Received: from [10.5.1.156] ([193.170.134.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d490794sm915439866b.131.2025.05.21.07.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 07:41:44 -0700 (PDT)
Message-ID: <7a6852e9-54f7-4fc1-b052-f673f9eddd97@gmail.com>
Date: Wed, 21 May 2025 16:41:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] rust: miscdevice: add additional data to
 MiscDeviceRegistration
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Arnd Bergmann <arnd@arndb.de>,
 Lee Jones <lee@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250517-b4-rust_miscdevice_registrationdata-v3-0-cdb33e228d37@gmail.com>
 <20250517-b4-rust_miscdevice_registrationdata-v3-1-cdb33e228d37@gmail.com>
 <aCiSRZjOETsD8MhX@pollux> <2025052107-awhile-drainer-38d0@gregkh>
 <aC3fYyvPvTB1DkeR@cassiopeiae>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <aC3fYyvPvTB1DkeR@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Danilo

On 21.05.25 4:12 PM, Danilo Krummrich wrote:
> On Wed, May 21, 2025 at 01:55:36PM +0200, Greg Kroah-Hartman wrote:
>> On Sat, May 17, 2025 at 03:42:29PM +0200, Danilo Krummrich wrote:
>>> On Sat, May 17, 2025 at 01:33:49PM +0200, Christian Schrefl wrote:
>>>> +pub struct MiscDeviceRegistration<T: MiscDevice> {
>>>>      #[pin]
>>>>      inner: Opaque<bindings::miscdevice>,
>>>> +    #[pin]
>>>> +    data: UnsafePinned<T::RegistrationData>,
>>>>      _t: PhantomData<T>,
>>>>  }
>>>
>>> I recommend not to store data within a Registration type itself.
>>>
>>> I know that this is designed with the focus on using misc device directly from
>>> the module scope; and in this context it works great.
>>>
>>> However, it becomes quite suboptimal when used from a driver scope. For
>>> instance, if the misc device is registered within a platform driver's probe()
>>> function.
>>>
>>> I know this probably isn't supported yet. At least, I assume it isn't supported
>>> "officially", given that the abstraction does not provide an option to set a
>>> parent device. Yet I think we should consider it.
>>
>> It's going to be a requirement to properly set the parent device, and
>> as you point out, this really should be in some sort of scope, not just
>> a module.
>>
>> But, we have two types of users of a misc device, one like this is
>> written, for a module-scope, and one for the "normal" device scope.  The
>> device scope is going to be tricker as it can, and will, get
>> disconnected from the device separately from the misc device lifespan,
>> so when that logic is added, it's going to be tricky as you point out.
>>
>> So I'll take this now, but in the future this is going to have to be
>> cleaned up and modified.
> 
> I'm about to sketch up something based on this patch that works properly for
> both cases, i.e. module-scope and driver-scope.

Let me know if you have any questions for me (if you want also privately 
or on Zulip).

I currently don't have the time to work on this myself. I'm not that
familiar with the C side and the Devres abstraction and would need to look
into these before getting much work done here.

> I think it would also be good for the misc device abstraction to demonstrate
> how to properly make class device abstractions (such as misc device, DRM device,
> input device etc.) go along with bus devices in the context of a driver.
> 
> misc device isn't *the* perfect example, given that it doesn't have the typical
> create and register split and another complication is that we also have to deal
> with the module-scope case, but it's still a very good candidate given that it
> is very simple compared to other class devices.

Cheers
Christian
