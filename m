Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0127243364
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745942845; cv=none; b=DGIxl+RD87nYwmsdD+PqBpsHIQDs9hzamm0wZHNilYvuNSOOANZqExSAc8zSGBKMPi/So6aKpu3z3UWdegJA1LfnXKKiXNZ/WzjnGOkOSrAhUuQdWkC+MbNXjLNIoIkHPcPhu46CVPa90JR7BY4pNLgdSgAwwDR2hyT/i6yEpzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745942845; c=relaxed/simple;
	bh=TSFZloEttw3ZUTFT0vTim52fWwqIpP85dAKVbWAvxeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qisEdoHOAnpNF1cNT6+uLqLg1Pb/50PNV2PsjN0PzC58CrcKAEO9ivx2m9BPiLTud2OO0ntDO5npzFmRatKJTLnQqQtBB31paxlFPcpWifdrNpFJgVCJNAmACgKjp91ccp/pSSy3hHDPNbtoKT5bZcNsv7S/1Zc0qdnvnDDapz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=et33YyJC; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="et33YyJC"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223fd89d036so77751985ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1745942843; x=1746547643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mC1UTKJ/aE2XaZGs9eJzOr2ci5VlY8Jj7KmPztDqUEE=;
        b=et33YyJCfXzaYxM6LmrmvX7A3/a55PHhBlajvgwqvXzc2XPSLmIbkxLDJmdP1kLizU
         7pkCqQTddIovA6HMpnKI2XCFthmx1RvIei01XWa7O/64IW2y5OfuO5hBSD/0cMqD0AEk
         rPIJ8BwJmDIYKulePDCICPx9VsWosawe5uitCFJDjXUbqH8QOHR7GTABtgb29RXmwjWE
         ueV+FHh0e3d2nnVktQf1mtGC6olbOgilagFQ5riv7IHJ8tQYSIkf75tDS4pVyhq5Y+zk
         e9r9dL4dprMpi+1o1Q+V4TbpldgbrsHUfYsQZydx9xmO2ZugLsiiWbrO+VTA4CdC34AV
         rp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745942843; x=1746547643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mC1UTKJ/aE2XaZGs9eJzOr2ci5VlY8Jj7KmPztDqUEE=;
        b=KvllFvUv1voCFbl9FHgqu2OpVte7Nuxz4b9fchXGsIRqs5cox+WuSJeFRe7Obkjo03
         rBKcuDKCwPwOcgSVkDVHzVqwDVFd7V5K6FWYLLu7Ij1I1QWqprDMCCGtLKlMnDOHu9/s
         TlFKA587L1apsRaNtenTeU4gR66rj2D459356H4JoNSOv3hOZjuvaTdddr2oximVoxgQ
         lO9s8zXqHcoF5AS1K56yptMr5l1kHMQkQDv/FpeLPHOpJY6Bb48+b1hAx4i4pv+RUXOE
         WlAz+EkOy8twebPmrDyXwrXpRDpuYOhpIUx8EA8jKkC4gHBlNK9po5kxymP1+HeOuxFt
         y4ng==
X-Forwarded-Encrypted: i=1; AJvYcCUVE/089ujmrCH15aNjnmMp+Dhf+0kWPN4UanyuWhMMkJyB32raS6/S1lMtEmsgUposgoLBUeQohY4oABE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjHsk6B6vp+V1UdyWv0XcOUavDJpTRJJ4L/6jIQC2JYP2RacvW
	nT1C6KoFDPDjJhdj82nk6nbxnYqWpwoUWUPDTB845hM5Vi5M8VnnXnKXuPeYpg==
X-Gm-Gg: ASbGncvmLzUoyJzOg3NTE8Q/VmJAjVuiV4j16lVG3B3UU3e/SQUIFzoIqE1Uc9ds2ic
	Lb49nzfNPeBMadK45g6cfznGKtKQ2UYr2qZyslmxgLkA8mUnqVN/M8YEdGVnzBWx+pxNaCiTUY6
	JUacB0Ar5YsRP/nSZkecitBf/k6mtVSm+GzVDlwYQK7tip671UUx3tNcQR+m6pRPXEhNVN7owY7
	GBItgwzpjJ1nDbUv+QYiZ79EYcQE+hzavOpVQejeQSdc4f32mc+RamHEZljyKTSJr2dW1wjFy9I
	Jh9xPu2XV8zMFCt1zqWLfPcu2eVi2H2DuqDzXUX6uUnscs4=
X-Google-Smtp-Source: AGHT+IHBM02KliheEDBQ/YbfFg9HkicKZ2Zh7waBOreEcgIMAIiWV3OXrKykhYTDFVeLIkUeSEyRFw==
X-Received: by 2002:a17:903:228a:b0:223:4d5e:789d with SMTP id d9443c01a7336-22dc6a0013dmr210547165ad.19.1745942842801;
        Tue, 29 Apr 2025 09:07:22 -0700 (PDT)
Received: from [172.16.116.85] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7aadsm104528495ad.138.2025.04.29.09.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 09:07:22 -0700 (PDT)
Message-ID: <1fda026e-9ec5-46f6-84e8-4111263350ff@beagleboard.org>
Date: Tue, 29 Apr 2025 21:37:04 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: kernel: device: Add
 devm_of_platform_populate/depopulate
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>,
 Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429-rust-of-populate-v2-1-0ad329d121c5@beagleboard.org>
 <aBDi2LE3O1rIsGqn@pollux> <2025042904-trade-leverage-0f98@gregkh>
 <aBDl5oRIRpwbPrC1@pollux> <2025042945-aviator-subzero-0263@gregkh>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <2025042945-aviator-subzero-0263@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/29/25 20:27, Greg Kroah-Hartman wrote:

> On Tue, Apr 29, 2025 at 04:44:54PM +0200, Danilo Krummrich wrote:
>> On Tue, Apr 29, 2025 at 04:37:49PM +0200, Greg Kroah-Hartman wrote:
>>> On Tue, Apr 29, 2025 at 04:31:52PM +0200, Danilo Krummrich wrote:
>>>> On Tue, Apr 29, 2025 at 05:09:26PM +0530, Ayush Singh wrote:
>>>>> +    /// Remove devices populated from device tree
>>>>> +    pub fn devm_of_platform_depopulate(&self) {
>>>>> +        // SAFETY: self is valid bound Device reference
>>>>> +        unsafe { bindings::devm_of_platform_depopulate(self.as_raw()) }
>>>>> +    }
>>>>> +}
>>>> One additional question regarding devm_of_platform_depopulate(). This function
>>>> is only used once throughout the whole kernel (in [1]), and at a first glance
>>>> the usage there seems unnecessary.
>>>>
>>>> In your upcoming driver you call devm_of_platform_depopulate() from a fallible
>>>> path [2].
>>>>
>>>> So, I think we should change devm_of_platform_depopulate() to return an error
>>>> instead of WARN(ret).
>>>>
>>>> If [1] needs it for some subtle reason I don't see, then I think we can still
>>>> call it from there as
>>>>
>>>> 	WARN(devm_of_platform_depopulate())
>>>>
>>>> [1] https://elixir.bootlin.com/linux/v6.15-rc4/source/drivers/soc/ti/pruss.c#L558
>>>> [2] https://github.com/Ayush1325/linux/commit/cdb1322b7166532445c54b601ad0a252866e574d#diff-7b9e3179e36732d5f3a681034d70c2fda4ff57745c79ad4a656f328c91e54b77R71
>>> Ugh, no, we should just delete this function entirely if only one driver
>>> is using it.  That implies it's not really needed at all.
>> Ayush's driver calls {de}populate() from a sysfs store path [2]; not sure what
>> it's doing semantically or if this is a valid use-case though.
> That's going to be rough, and full of tricky corner-cases and probably
> shouldn't be doing that at all :)
>
> So let's hold off on this entirely until we see a real user that can
> actually pass review.  Trying to do system configuration like this in
> sysfs is a much larger discussion than just adding rust bindings.
>
> (hint, configfs is for system configuration, not sysfs...)
>
> Anyway, worst case, you just "open code" the single function call that
> this one binding was trying to "wrap".  which is what I think the
> in-kernel user should be doing now.
>
> thanks,
>
> greg k-h


Well, I don't really want to convert this discussion to addon board 
connector setup discussions. So I will try to keep things as short as 
possible here while linking to all the other discussions for the same.

For starters, what the driver does is as follows:

1. Provide 3 sysfs entries:

     - New cape: Can write the name of the cape (I have not settled on 
the naming convention yet). This name is then used to load appropriate 
overlay from `/lib/firmware/` and populate all the devices. The overlay 
is applied to the connector node. Only one cape overlay can be used at a 
time.

     - Current cape: Just a ro entry to get the name of any active cape.

     - Delete cape: Remove cape overlay and registered devices.

It's a very basic driver, where I am trying to experiment with the 
following patches ([2], [3], [4]) to be able to provide a better picture 
of things, and get a read on what more needs to be added to devicetree 
spec and/or other infra to make connector setups possible, and provide a 
proof of concept that might move the needle a bit more than the past 
year has.


I do not think this should use configfs, but maybe I am wrong.


`of_platform_populate` is used to discover the devices that are added by 
the overlay. Without this function, I am not sure how a setup which is 
supposed to only modify the devicetree in a particular node is supposed 
to work.


The reason why local devicetree overlay is being used instead of 
modifying the local tree is the discussion here regarding how global 
tree modification is a security problem and any approach using it will 
be difficult to upstream [0]. That is one of the reasons for not 
pursuing the approach described here [1].


I am okay with maintaining the patches for Rust side out of tree, 
because well, at this point, it's a much smaller list than the number of 
out of tree patches I need to have for the C side to be able to show a 
semi complete connector setup anyway. And nothing is going to be merged 
until a so called perfect solution is found. But just want to list out 
why I at least do not want the C side of 
`of_platform_populate/depopulate` to not disappear.


Of course, feel free to list out any better alternatives than having to 
use `of_platform_populate/depopulate`, which can be used for this purpose.


Best Regards,

Ayush Singh


[0]: 
https://lore.kernel.org/all/9c326bb7-e09a-4c21-944f-006b3fad1870@beagleboard.org/

[1]: https://lore.kernel.org/lkml/20240702164403.29067-1-afd@ti.com/

[2]: 
https://lore.kernel.org/devicetree-spec/20250415122453.68e4c50f@bootlin.com/T/#m591e737b48ebe96aafa39d87652e07eef99dff90

[3]: 
https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@bootlin.com/

[4]: 
https://lore.kernel.org/devicetree-spec/20250401081041.114333-1-herve.codina@bootlin.com/T/#t

