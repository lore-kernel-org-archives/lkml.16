Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD10295DA9;
	Thu,  3 Jul 2025 10:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539603; cv=none; b=lfl/ZwWm6pRGoXYRLDJqoY1H+8QIClPz9L4ufijuxzX7L35wwd5csd4kUMn9yeS1jnDshLr8prC2i8ktixeq46xALq/nTN+WuSHVuZr5+GPmmWgmlDFvZUgkE0ytYRx13qQdXjst37e9Bsou2MCbkBZBt8b2dBPv2hyeb9mNkV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539603; c=relaxed/simple;
	bh=MDprOtwUwQVTK0Sa0F3ryVGRaYd7wQ6YQ990mpaQSqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+EVATvlrDiNfhJOzkvdfPZkfrFVYmnpelm657Dwd9I5CnsJn2spRQlAD3JrAD/9O1YjgxIXHOongt6IKApLTTJY413G06+WIAFoyB8KSguAdqGI61PLcGjoK1wgqhs9Op9VpDuQlRUmpOvGl/reeDY9ys8B5cjNiM6CO6xNJ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=rZOP02ua; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="rZOP02ua"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uHE2Sz4tSWkVHZNPOCqymh9OWBFs/4o18Ht0g9fHypQ=; b=rZOP02uarHKKBiJ9jp9rFpj0YQ
	2ZHF27MQ/xPzmqpzYCoHlZrO6Cp2zB2x0CL9m/MlmKJga+kdBh1jCFOPBneClK3r2vjpPkCjzXuhQ
	Tanavd7w1cJPS+b0BgTiUCBOwdO8A0J33agAZC0IMdYlTwjlfIbF2GtyqhhYl0wwgSM7dd5aIr29I
	n/i9l75+4mpph/7tsJwV1EX3QFK8waX5T7x0lGdEIqXKjRidmDiTlPKAIXrePkLKLbu184LccvFrs
	yqiUOsskbYb6LAtNH1lyO9xwXUHfUhketdfo5b/xuF/Ec2auOweXzVC0Myv0sJXIz6XwB799pTrlh
	fysIbryA==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uXHSC-00Brd4-If; Thu, 03 Jul 2025 12:46:08 +0200
Message-ID: <5f28693f-a181-485a-aee7-38c5212bdea1@igalia.com>
Date: Thu, 3 Jul 2025 07:45:56 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Introduce Tyr
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Daniel Stone <daniels@collabora.com>,
 Rob Herring <robh@kernel.org>, Alice Ryhl <alice.ryhl@google.com>,
 Beata Michalska <beata.michalska@arm.com>,
 Carsten Haitzler <carsten.haitzler@foss.arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Ashley Smith <ashley.smith@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 kernel@collabora.com
References: <20250627-tyr-v1-1-cb5f4c6ced46@collabora.com>
 <f0ad78da-d4ba-44ec-beda-4f8c616053f8@igalia.com>
 <C2A539D0-8C07-44A4-93AD-21343396D84F@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <C2A539D0-8C07-44A4-93AD-21343396D84F@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Daniel,

On 30/06/25 10:53, Daniel Almeida wrote:
> Hi Maíra, thanks for chiming in :)
> 
>>
>> To enhance readability, consider using a regmap similar to
>> panthor_regs.h. This would help avoid 'magic numbers' and make the
>> code's intent much clearer.
> 
> 
> Are you referring to "struct regmap" itself? Because last I checked, this
> abstraction is not available upstream. There was a person working on it, but I
> guess it hasn't seen any traction for a few months. I also don't see it being
> used in panthor_regs.h?

Sorry, I think I didn't express myself clearly. When I say regmap, I
mean using macros to express the register addresses and its fields. From
example, in Panthor, "1 | bit_u32(8)" is expressed as
GPU_IRQ_RESET_COMPLETED, which can make things more readable.

Best Regards,
- Maíra

> 
>>
>>> +    regs::GPU_CMD.write(iomem, irq_enable_cmd)?;
>>> +
>>> +    let op = || regs::GPU_INT_RAWSTAT.read(iomem);
>>> +    let cond = |raw_stat: &u32| -> bool { (*raw_stat >> 8) & 1 == 1 };
>>> +    let res = io::poll::read_poll_timeout(
>>> +        op,
>>> +        cond,
>>> +        time::Delta::from_millis(100),
>>> +        Some(time::Delta::from_micros(20000)),
>>> +    );
>>> +
>>> +    if let Err(e) = res {
>>> +        pr_err!("GPU reset failed with errno {}\n", e.to_errno());
>>> +        pr_err!(
>>> +            "GPU_INT_RAWSTAT is {}\n",
>>> +            regs::GPU_INT_RAWSTAT.read(iomem)?
>>> +        );
>>> +    }
>>> +
>>> +    Ok(())
>>> +}
>>> +
>>> +kernel::of_device_table!(
>>> +    OF_TABLE,
>>> +    MODULE_OF_TABLE,
>>> +    <TyrDriver as platform::Driver>::IdInfo,
>>> +    [
>>> +        (of::DeviceId::new(c_str!("rockchip,rk3588-mali")), ()),
>>> +        (of::DeviceId::new(c_str!("arm,mali-valhall-csf")), ())
>>> +    ]
>>> +);
>>> +
>>> +impl platform::Driver for TyrDriver {
>>> +    type IdInfo = ();
>>> +    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
>>> +
>>> +    fn probe(
>>> +        pdev: &platform::Device<Core>,
>>> +        _info: Option<&Self::IdInfo>,
>>> +    ) -> Result<Pin<KBox<Self>>> {
>>> +        dev_dbg!(pdev.as_ref(), "Probed Tyr\n");
>>> +
>>> +        let core_clk = Clk::get(pdev.as_ref(), Some(c_str!("core")))?;
>>> +        let stacks_clk = Clk::get(pdev.as_ref(), Some(c_str!("stacks")))?;
>>
>> Shouldn't it be OptionalClk::get? From the DT schema for "arm,mali-
>> valhall-csf", I see that "stacks" and "coregroups" are optional.
>>
>>> +        let coregroup_clk = Clk::get(pdev.as_ref(), Some(c_str!("coregroup")))?;
>>
>> Same.
>>
>> Best Regards,
>> - Maíra
>>
>>
> 
> Ah yes, you’re right. I will fix that in v2.
> 
> — Daniel
> 

