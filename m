Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E21283FCE
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288826; cv=none; b=XO7mlIN4rvkMdbgIOvkdYxZREuV9WtFhTGW7VMmiUomtCCEF+chuTyK3WgxJeMMZbM+kxzxfIH/yT8vyTKVZzPUqcWjL2GhGvAy3B9c6jzyq/MrIVOM9Z7iRCN68XXLHHVaCtIRQ75cHLgIXRmrghvJ+odGBODEdp9VMb4fhV/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288826; c=relaxed/simple;
	bh=XzSA8lqce7ObaJi4R2x6wnKGTAh2x5xLjrtEhvRLgZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJnRP4amCRILILmsLvQtaWVDwZv38UY1AuxXSpNnTKimua+0RSSOW49rfdaTKdyT93fyK5cVjhcMXV4HhqAlSbw3BMfmoo+xfL7VrQgAbP7bNt9gSBFIyoOiG0jdwgMSsUhnCuwuGb+pmwz1C608dsbus1gRqdfNrcJUackWuck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OPddzOeR; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OPddzOeR"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so3194061a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751288822; x=1751893622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fjTqc5w8WVqrn6bONYW3G2Bp0s1AYzagFEFfl1Akrl4=;
        b=OPddzOeRIk3YNhPdxHYL7w8/GQj4aeVwJUTambd8nomwNZYXveT5WhdXDixyHmv2Dw
         B4pfGinQQeclX6LQhxXG/ZSuW+JehuyvHlfKyXQChpNzPKLNn2tUZ2ZX7C2UeB4Y0g3U
         kK9hW1DSFVq/Y7kgIlJNlThQX6YhlH7WS6pKrkLrmNQGMOMLlSPQsSLJzlL1pFSNh2J2
         jqKo0BWE4qBW7v7Bl4jRUOjOTpJdZWMkVUs8u60NSmJP7yPqalddVWPnGW5X9nfkc5g7
         kanr+QlbqJj/2K9qDQSzIvVcq+3wGPyRQ3RkcZq00ycy0dqUuhPqzc+Vd7F6IMMdUmpO
         Ewbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288822; x=1751893622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fjTqc5w8WVqrn6bONYW3G2Bp0s1AYzagFEFfl1Akrl4=;
        b=I1kfjVRzFLjvAvaZvlkPp1C1mKJ/8HGU/PbWEi3jXJBBBHUclAmis1M9CNfq8XMHON
         Es1bDH/I41kMGrJR4hMGvqHHPhlE1Yn0BvQPMBLNNzDS+7sqwbQCFXlZNuHNRbOAKYSD
         5y9/Xs9vSMhbbRdVMKQCKQ7Y68emi25nGToaYBFhS0CWHSdlYWaq8tnDenMXK+nKr+dI
         u/9+74Jqg5SBV4yWhyUkv7t1jUVAFSV2oGSDxxdnd6Ys/k3Hv5s244ULeSRJBs5xT/gx
         HndWS2OFph85nu1RiiMyY8bpQcKVud/Xee3wvL7ATZeJva8/KvS/TyoYNtam+OJaRiku
         yZCg==
X-Forwarded-Encrypted: i=1; AJvYcCVvDOL1p4U5WaO8sUx451fw+Xe6g/0KmeKfIspyvZhZuLfdHxSoWYx82U7/4HgBF+DTIzU+9RnWLjtu+xs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAjrhluJMu6I+C4BVBivqSXaj9sY7882/nVAlVooWK+4V1ievj
	TjMTBdRjW1E2VvltHkTvJeiALvaBeUlA8BE3X8SDrtemcfAORGMiTXsotK28QmuX1Pk=
X-Gm-Gg: ASbGncvR5hdhrFLffOqOP1s/QXJsfPqCgdtZo6HEdy2ZimiAHXBacpKe4E3pSJYBbsv
	40rvJEKpKroPdwOJfiIxJ3w7t/I/QY0vux/7kl049/JXNKXAE0Ns9mbp5JnzABd7gcaoOOA6s40
	+4RKptCwtzSozsNZJ+JteDSuOEt7+EwikdOW2OzGAoSDf7m0rvgESfvlHCXrjrmthTlosVbxrQE
	b8yG7AcP2uksSEcbDm6SCS4doXDsklBssunNbTc0Zf2KjBQ9TUaj1OMIR9ty8V2ezJgcAmLJo33
	QD6DwVL+ImOaxc5Zs5vuV7ebAKNxPKXOakMw9xaR6XjNZkA1/fuv3eH03I/cOyUgrJ5Mr2JNHKh
	yovIIahyzkgSV5amgCMvbuZYo2A==
X-Google-Smtp-Source: AGHT+IGQQy4U19NiLnmRx9yAJ+yqWDYzFld5hJO9BbU/RWXFjYdkBLOk4FCpcLsDyCYGwv+95jV0NA==
X-Received: by 2002:a17:907:3ccb:b0:ade:3413:8778 with SMTP id a640c23a62f3a-ae3500b8e0emr1306050466b.30.1751288822034;
        Mon, 30 Jun 2025 06:07:02 -0700 (PDT)
Received: from ?IPV6:2001:a61:13b1:b001:7c81:22a6:ebbb:9d2? ([2001:a61:13b1:b001:7c81:22a6:ebbb:9d2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bc08sm664696266b.131.2025.06.30.06.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 06:07:01 -0700 (PDT)
Message-ID: <9ca2c058-d562-4c9e-8d0c-695703573ed7@suse.com>
Date: Mon, 30 Jun 2025 15:07:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] usb: core: Plug the usb authentication capability
To: Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>,
 Oliver Neukum <oneukum@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Kannappan R <r.kannappan@intel.com>,
 Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Thomas Gleixner <tglx@linutronix.de>, Pawel Laszczak <pawell@cadence.com>,
 Ma Ke <make_ruc2021@163.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>,
 Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>,
 Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
 <20250620-usb_authentication-v1-3-0d92261a5779@ssi.gouv.fr>
 <94cd36e2-db7c-4693-9f43-01c855dc6891@suse.com>
 <6dce47fd-01fb-4401-88a3-d9e85ee5529a@oss.cyber.gouv.fr>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <6dce47fd-01fb-4401-88a3-d9e85ee5529a@oss.cyber.gouv.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30.06.25 14:34, Nicolas Bouchinet wrote:
> Hi Olivier,
> 
> Thank you for your review.
> 
> Indeed our current implementation of the usb authentication is still a bit
> crude.

that is understood, but the question here is not just whether they
are crude, but whether they are sensible. You are putting the use of
the authentication code in usb_new_device(). This means that the admin
cannot change the settings of currently connected devices. It would seem
to me that the check should go into usb_claim_interface().

	Regards
		Oliver

