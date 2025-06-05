Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D261DFF0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749126876; cv=none; b=d3DyDEw7wsPODWONJHewdEOz8QUwMPs5FuIKk14GRdJIOv8pm3wI1l1mFmvv98fuoVMpNqG+YQO0QfKYEFkxyoAtNhZEZcAC3mmnd67izKo0jg3BuY2GpPmW94XGMlRpbX/4f21OxthLbcki+0CeJdghrspLbZk3i88wGbr9z1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749126876; c=relaxed/simple;
	bh=cjbh1iJPcHo1SoPgqjrQYH/wQ/TWFV5f6hNewSpBYZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UuwT6P48eWp87q1N+DdhJ/EezcLW9jGDPwo93rfc+70lCQIkfK3mDrGTE73SpmXkivqEpQNPz3yCSfBivyyc7Si2A8k6nm2TzaoMknbpuW84aGryF/LMaFvO0Z/4yFaDEdLxHgaXXGeJ35WZs3+mXsirTpRpwpiea1ERzQidH8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COomPcny; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COomPcny"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a375e72473so443456f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749126873; x=1749731673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exkJCJom4RO5dcCa+OJwP+hizG0/yi1+ayoRAtNv+kQ=;
        b=COomPcny5A6K7VTC/wQpkYlI1Vk9iawGMSCH6TtUwofIa5ELpV/+mMAuQcBtY4+zeE
         5Pufd1iXSQ1G4YyhcYsvtbsw1eQ6twnprFisxnsN4zCtjLAfqV1Cz6qGpxlTsmRECNEJ
         r5Zn26cHGXiJxsZYS96yU/NCsHy3Hbes1cgZQpSvVYsrQQDm7an3xWv1gsZhi6xZ5xCX
         MO8dp5oJzbRfBsLCijhmSmDh8PV1H/55cI7lKW+Z1OcGilbcFB1sR0wWAanz0ULlwKs7
         n12FTWqw7RWUJck9R70vK3ZDjqgX2t502xjwcANIWD2bldew9LwM3ih774jGI/MryaFB
         ZIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749126873; x=1749731673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exkJCJom4RO5dcCa+OJwP+hizG0/yi1+ayoRAtNv+kQ=;
        b=ws5591/EakumygOI9f1d0iu/vVhWll0/Ve2dgz2+a2Jye4jMWPtTC+sqlnOmVpAX2z
         q8GgqgWZrpFJ0wnvx1Mq3FlzMPyzcsS4lPehxsVhjzL6iGmGV36Ozr2IQ69WiiRbcaWH
         b5szjImKDNVT8cCkec5y1v91aHkhQwWu3LvVii2ISHUPrBSJdG4jni26Z5LhP/NNdX9x
         Hv731eF1yc/3wpn1RIDmeSUqdoN/rOuvbZWo2VBRZQMVUhQog3eaZR4IeydlGaKRbSCO
         VBmkYc6/WR7YidXZK+Vh7kEKiQ5xQxE0+H3xqcS6cY+tMwWz6asOt9eaB+B8B/QLgYrS
         lb8g==
X-Forwarded-Encrypted: i=1; AJvYcCVob+rY2P0km/s2xN1LFPaxKy1p4E7ZKUTUo6gfl9ST2qc2MWdFAgZ+MwaChBm8/pTKKr6BcdJp9gpeN5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn9Cf03Q67elgrbkOAyynlETMaL+uOgUpb8fwuFdYRf4I4tOZL
	BD6+LUUHcEsty9+OVuZF88gDhOkLKPW53qN9hxEIYRjerTaFyieeef4BLCMsgwNcMOY=
X-Gm-Gg: ASbGncuUf0ZRt/0DDabFjpHlt6hITiwN1DJp+TOV1WBpcr0KkaV1MYmsL/FVdi/Nqu2
	hi5Qn3juK0N9wpfdxkqN0C8oAQvQC1hl8fxx7zxdEweClq2huTKxSLsYeTD4Sb5ioDn17xD+IRG
	Erlz2uSWacXnSN52sdwVk6RYpst4svYP7X9Z8uGdIkfwCvfCGlu7874Ipn4l6fmnWbBUFMdCkcf
	DtYvSZUEU647NfInafy77uzbjMmuk9F1IBC8l7D7oRu+yLiX/WB8cAD9JShkNlEHriYOdz8E/bs
	mudIXDPa76Lae7tdjBPbxFSiCrESZXRqr6NWZSZddoM2dRCmJEzLvQAV5Dw887xOSJh7/SXuM2q
	wxENfbap6EjZU0YMC
X-Google-Smtp-Source: AGHT+IFay1Kv4O/AIX3uTmBLPt0/aev+6Rj7lbZSat73UDWQjBuMnLbHPYrx37RB3wdZf5F86HsTfA==
X-Received: by 2002:a5d:5f90:0:b0:3a4:d41d:8f40 with SMTP id ffacd0b85a97d-3a51dc3182amr6168249f8f.46.1749126873038;
        Thu, 05 Jun 2025 05:34:33 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5236d4466sm3690446f8f.100.2025.06.05.05.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 05:34:32 -0700 (PDT)
Message-ID: <5854a587-aba7-4e71-87f8-249ba00cbc59@linaro.org>
Date: Thu, 5 Jun 2025 13:34:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Renjiang Han <quic_renjiang@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/05/2025 01:05, Renjiang Han wrote:
>>>
>>> Note:
>>> This series consist of DT patches and a venus driver patch. The patch
>>> 1/3, which is venus driver patch, can be picked independently without
>>> having any functional dependency. But patch 2/3 & patch 3/3, which are
>>> DT patches, still depend on [1].
>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video core
>> on QCS615 over(?)clocked.
> Agree, so we need to make sure that the driver patch is not picked after 
> the DT patch.

This statement is confusing.

1/3 states that there will be a fallback if there is no OPP table present.

Giving the code a glance, I believe that is so, freq_table should be 
used if there is no OPP specified in the DT.

I think we are having a hard time here understanding what you are saying.

My understanding:

- venus modification is standalone 1/3
   Qcs615 will fallback if no OPP is present

- dt modification 2/3 3/3 is therefore also independent of driver

---
bod
