Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68B4289E1A
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632257; cv=none; b=qxkzfTtcTs7KJ7m8Ki/7vgDPFyYO6/GwhW5KtBcth5GRYHI6oHlYJrDp7m5ch8Euvghhn2QEL05KeEa9Q0x77GyLuRYG+g76rh2bJV7bV59dMAqq1T0+g2pyQYh94fc+JLK3ZzrL1BIN/OJ+uvAUEeWE1s9f+/Vh4sFFZCO9yrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632257; c=relaxed/simple;
	bh=itefw7osb12hSN2O1c0KuZaS6PgNbKAO+Y/ON68WOpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ujmrq0ae7Bctqe7/tDdV9w1NJjDurx0vWEd2isXK9FP/fmp2ZKFl5bK9cfhD5bJXHYbz+iTwGHdrMt5mMG/64tDTVqaHaZ20YeLRFLXrppd2Sb3KQ/cplpQ89Lf8Zd/VX7wDkkDfgwaG0yIZPrxEGfOtmuyRSGHVLygYgdAG9Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Ey6ROsfS; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Ey6ROsfS"
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3441A3F29E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1746632251;
	bh=fr9yeU7dVZUGfHuigq4Ki6OIiok3yQVQgVBSFzRvIM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=Ey6ROsfSXndEv2/Yy/d4j/uhDrb02awVTgg+VAFxOLKqGAoMgR8q0aCZaaIia/Cb5
	 nSEt6FTcVd0be6Xa7Sl5TvjAexo1Xgm0kG2kN2HDdPIaunmlJYQXFahpfmbykLHncn
	 b54dVfLCtK6OQGwqm+B8qGkmu1TxNTsRBmdmfyC55IUKnUcprIYx2o7QHiJBRkA49U
	 2wd8AJ9i4mVVA0P6ndpMN9icl7gMvWtN1Qd/cxPbu92AervMjy/i8op2QruivbrUGX
	 vzE7GpNJQbK7ctzje0B9ziW2S1i0ZBKYUCwcPeyfrK7JcE4TFnBURakP6JFKkKkoct
	 kEXWG8ILOMPCA==
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acb23361d73so128984366b.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632247; x=1747237047;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fr9yeU7dVZUGfHuigq4Ki6OIiok3yQVQgVBSFzRvIM8=;
        b=Qw3DxShWf1GVBEzzOffoT/9FwNW/Fr8Kvu1OcqVab2kojQGCz1pkaqxg9es/La9958
         oQfnI+MyfkGyhiNecZj/mBg5Cjd8i4Mu+zky1TNiNkF+DWgzOhiGJCNlrFyYJZVPKLjN
         dP5oSFhS1tjUswTosp7oqtEBgT6wKQhXPOh9Zf0SCbNytm+XCEuMZUgm325+uCz0Bl/m
         M00KnDeTVhx1Q7Z27anG5N5Kzee+xsWIdAMNRmPy+IIaF4lDqGfx0NVKVG+yGgjXrMRc
         UDWwSR45BBLjNlQtIHqcbzLF0Bm1FYVoviZlA9wo6UFn+IwfxHBPO/ejYAs+H3KZ1toT
         m8Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUpqRVZUEu4goAJQIxCGyohRq6IOI3ECEgtxV026EWhkOVC6Bnta4FfSrD26FtTRdRVqvMGJ5xscjEi7m0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlW64/0cP/eGfgM1lyjTmRONyK88adwnRHzJvYZjL6l+M/7FrJ
	TwqK4SI6awtvqhkSSG7xsCuLcGcjVMYsnMmQgI/G5cpQ5Ee9dE8PEKMvIx6maHM+bGuEafRjnm9
	mggUAN3/9Ojdq4lEIExG0PUe2l3U3QNpnu4ui81EVK6zH26tAC0NA2Pauba3mIjIiyXZssxEV6C
	kRGQ==
X-Gm-Gg: ASbGncstd6sN+zYwniXZXnV2TSSRIk1IWOLUgoX0w+5TwML0Fv3YIq9HLbnzfbTnfI1
	bhuMdPhthd05J4h0tjFxI4fkUr42g2aKNaKk5DIinEzD/uiD2CkdCui9SkQqaN5VsNE1OAnaq/o
	y/+b4nP/wL06fv1KH7CNJsfboVJ3wGQ//9zIpzEWBxTw1GjMADUZW7qaLBfCSpRZc87gu0HhyiT
	Iz+zgfIzWfvpg8qqIb56r9rA8y5nqeB1BPwMOe23vpiWATi5rBYXmTicsNYW7B/FcpnkgvLe1pg
	C+qPQi8tk+qd2G9oKLokXkxskK3GzJV8xINlDh8sQNGN4TFhFbJ9WlbVp6eCRS0gHXc=
X-Received: by 2002:a17:907:cd0d:b0:ace:be7c:11df with SMTP id a640c23a62f3a-ad1eaefaedcmr364827166b.6.1746632246819;
        Wed, 07 May 2025 08:37:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3LQvsicm0YBjAOHirumoX4UDCK+hCXE9ScCJp5xtKINT4FyusXCl/66Pqvnso9XRhvIDAPw==
X-Received: by 2002:a17:907:cd0d:b0:ace:be7c:11df with SMTP id a640c23a62f3a-ad1eaefaedcmr364824366b.6.1746632246505;
        Wed, 07 May 2025 08:37:26 -0700 (PDT)
Received: from ?IPV6:2001:861:3280:410:2ef0:5dff:fe60:6274? ([2001:861:3280:410:2ef0:5dff:fe60:6274])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891ef1e0sm923525466b.77.2025.05.07.08.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 08:37:26 -0700 (PDT)
Message-ID: <bc252425-2703-48c4-a1fa-9268124c2386@canonical.com>
Date: Wed, 7 May 2025 17:37:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] lsm: introduce security_lsm_manage_policy hook
To: Song Liu <song@kernel.org>
Cc: linux-security-module@vger.kernel.org, john.johansen@canonical.com,
 paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com, mic@digikod.net,
 kees@kernel.org, stephen.smalley.work@gmail.com, casey@schaufler-ca.com,
 takedakn@nttdata.co.jp, penguin-kernel@i-love.sakura.ne.jp,
 linux-api@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-kernel@vger.kernel.org
References: <20250506143254.718647-1-maxime.belair@canonical.com>
 <20250506143254.718647-3-maxime.belair@canonical.com>
 <CAPhsuW7q1hvOG7-uG2C8d_wWnOhEmvTmwnBcXZYVX-oJ8=5FJQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Maxime_B=C3=A9lair?= <maxime.belair@canonical.com>
Autocrypt: addr=maxime.belair@canonical.com; keydata=
 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
 yriCIKEAbLqHTyj+RhbroZmv5q3X7iVq
In-Reply-To: <CAPhsuW7q1hvOG7-uG2C8d_wWnOhEmvTmwnBcXZYVX-oJ8=5FJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/7/25 08:19, Song Liu wrote:
> On Tue, May 6, 2025 at 7:40 AM Maxime Bélair
> <maxime.belair@canonical.com> wrote:
>>
>> Define a new LSM hook security_lsm_manage_policy and wire it into the
>> lsm_manage_policy() syscall so that LSMs can register a unified interface
>> for policy management. This initial, minimal implementation only supports
>> the LSM_POLICY_LOAD operation to limit changes.
>>
>> Signed-off-by: Maxime Bélair <maxime.belair@canonical.com>
> [...]
>> diff --git a/security/security.c b/security/security.c
>> index fb57e8fddd91..256104e338b1 100644
>> --- a/security/security.c
>> +++ b/security/security.c
>> @@ -5883,6 +5883,27 @@ int security_bdev_setintegrity(struct block_device *bdev,
>>  }
>>  EXPORT_SYMBOL(security_bdev_setintegrity);
>>
>> +/**
>> + * security_lsm_manage_policy() - Manage the policies of LSMs
>> + * @lsm_id: id of the lsm to target
>> + * @op: Operation to perform (one of the LSM_POLICY_XXX values)
>> + * @buf:  userspace pointer to policy data
>> + * @size: size of @buf
>> + * @flags: lsm policy management flags
>> + *
>> + * Manage the policies of a LSM. This notably allows to update them even when
>> + * the lsmfs is unavailable is restricted. Currently, only LSM_POLICY_LOAD is
>> + * supported.
>> + *
>> + * Return: Returns 0 on success, error on failure.
>> + */
>> +int security_lsm_manage_policy(u32 lsm_id, u32 op, void __user *buf,
>> +                              size_t size, u32 flags)
>> +{
>> +       return call_int_hook(lsm_manage_policy, lsm_id, op, buf, size, flags);
> 
> If the LSM doesn't implement this hook, sys_lsm_manage_policy will return 0
> for any inputs, right? This is gonna be so confusing for users.

Indeed, that was an oversight. It will return -EOPNOTSUPP in the next patch revision.

> 
> Thanks,
> Song

Thanks,

Maxime

