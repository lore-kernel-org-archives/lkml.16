Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEB186337
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863699; cv=none; b=BpItlTLcmtqRbROHwxBSAyp6Sy29lriYJcQAKZ4aF+tKG3U5bG4Dq4eQSrHqC3u0uLyeWYUewmSUZ2Fax/j5SAwPuxRFt/vbkVFJcGm7VVY+xY0UdzUpwCkbQuoKOoYJ5wKRKCryAGDMe1oFBXMLXO+fkDpfzppaSRnoOcumy0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863699; c=relaxed/simple;
	bh=mjKGXvYRAeV0j9q55iDsvNYd/AmBtJccQ5OLEaOQmb4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WzmC/LPrFDU3NTTSHQmV5uPF0spiAaa3IRVtFWSgryhZwDJR58/pd37yzUzzreKrP2ZcKGfF6SZIaSho/gkzbtxiREdCqQO6FCwr/ZSqDLFgnU9IX9yMRYojS6gEZP1u4qQIEzE0wox5twCG7Snnc6ZEjEDL6vyXuJDbiFO7iD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1Va061g5; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1Va061g5"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60c5b7cae8bso939785a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750863695; x=1751468495; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnhUDg+i4p9VBXEoyxzKCCrO1ndShC+avgmK0GaloHg=;
        b=1Va061g5uxi+ZmMR6Z9hmFQna/WcktJ8rSPg/wH1PoaEqOHQwWukTV1BsfVbhioM28
         /mhOd+nA3mqmOCqFuGyK0MmHyIfjzzcfgiH4WQUmR43mDgKOg7oHzEZ6gEEKtSWCwYXT
         aTJIRjR/uPuz1YcTt9V9lE0UHi31zEEoSyPRyVYo/DnZBerSauhto3Ikp3GTQylDJlNs
         PMED0YTT26CW6it/ijeaDvTeRWNgaxQCshJCnKTPQElyUioZ0OVI+qMrfw/k7fS7SSlZ
         A+C701+WL8QHD1xXTOvp/ELXSvuJVDDcRFLD2TJWSgK+++bU2VUT1Tc6i0v4DsoMoNKz
         SzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863695; x=1751468495;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OnhUDg+i4p9VBXEoyxzKCCrO1ndShC+avgmK0GaloHg=;
        b=lhWvyH2RQHo6W63EB+j2Qt5hd+U9DsQfla4oNXRwwAKsX/WBb7MgZRaKLRqKIhdy0n
         esUZDwlZfpPKSvtUIjTgoGxnmVlJTJhbeizapDrHG99NvN5CVBEMv6g/ZO6v0xUD7jmk
         DZHBM4fSyTZ8dRnMiUIo1IVF6S0RHvUX++sfGhVGCtzepVq9xtCu/s0SHDc1Pr9oTqiW
         JFXK/Ii9SKiXOdt3RCqDSZW81UPmDFNFBazLHYh4UihTJOoygvRkxVUMfpr3sR20NGS8
         t9zSm56QKRoMvRIzOC4VqWHGBOk0Tz6is4HxWGeZnJXaZQlSdqfx/n8aOGhBzWSmGRd+
         GO0g==
X-Forwarded-Encrypted: i=1; AJvYcCUxaQY1B6faMW2+XrA/huJErOu9iTTkINqRTz9QH/tHn3XSCIC6QiyRq4HoCI5pdFFoIo3M3zcoPxm5R2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfRfEh53V95nCCdlbuCrFnkUKyPkgYHqdRAiaLtVq7Reeyi8wJ
	GO8UfGCgo9knZ2FeC9Y8ev07Zay5cevObXXK/6Fa1JMt9SxDE/9vP65D5tPqktuUZqIsvMpGWMd
	+OXgI
X-Gm-Gg: ASbGncuuCJ1FG0JtPMlRuquTjE9hi8dlCRp1zczIRGcOdvjD78OwKqs2ZmwRlgD1rgM
	16Mn11n/Z8k5K8WBsoDVngppJCIyuNOvfQE+luMO/VxlSCxqt8Ua/a6grv35meVzurk/TWRub+R
	a0wt3in5ymGFWZU4qnYVi+p7spmbwdCnH6WFsmsV1OXleY0hFZAx2wRUlWrBB8IoFgjUcQAt9Jt
	jHaZCvv/8pcne20kPJcxtM9FhtcJw7Vst8rwf16zZFl2mrRFq4uh7RDWS0iJsyJkQB1783y2Rr2
	1INoJq17KN+Ep3Y1OE9/qrmVZXgrLzfVfw3QpMY412dbAz8+R/nkT0VOG0K7WHSlAPfIyug2V0+
	9Q6z5HHEd5OGWj91IOyv387j0PmvXKpM=
X-Google-Smtp-Source: AGHT+IGR7eTLwLr0fdOCYaZCuvWw+/lu8Yn8bZNjsxmvuaS3Yo6hqW5sayVf685GRx2r82h70xi24A==
X-Received: by 2002:a05:6402:84f:b0:605:c057:729 with SMTP id 4fb4d7f45d1cf-60c4de864a1mr2730749a12.34.1750863693017;
        Wed, 25 Jun 2025 08:01:33 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f196ab3sm2609163a12.3.2025.06.25.08.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Jun 2025 17:01:29 +0200
Message-Id: <DAVPDN4U6FSJ.1MHMT5G04KSKA@fairphone.com>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Fenglin Wu"
 <quic_fenglinw@quicinc.com>, "Stephen Boyd" <sboyd@kernel.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Add support for PMXR2230 PMIC
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-pmxr2230-v1-0-25aa94305f31@fairphone.com>
 <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>
In-Reply-To: <zmqkdpmji2uodm3mxcteteyhfkef47kihola6vtxb4mhuynqwz@hvgfd2637mhz>

On Wed Jun 25, 2025 at 4:25 PM CEST, Dmitry Baryshkov wrote:
> On Wed, Jun 25, 2025 at 11:18:36AM +0200, Luca Weiss wrote:
>> The PMXR2230 PMIC is used in conjuction with SM7635. Add binding docs
>> and the devicetree description for it.
>
>
> Please use PM7550 instead.

I'm happy to not follow downstream naming conventions if being told, but
do you have any details whether PMXR2230 =3D=3D PM7550, or PM7550 is just
another SW-compatible PMIC as PMXR2230.

Also we already have qcom,pmxr2230-gpio upstream, so that would need to
get updated for the PM7550 name.

Regards
Luca

>
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Luca Weiss (3):
>>       dt-bindings: leds: qcom,spmi-flash-led: Add PMXR2230
>>       dt-bindings: mfd: qcom-spmi-pmic: Document PMXR2230 PMIC
>>       arm64: dts: qcom: Add PMXR2230 PMIC
>>=20
>>  .../bindings/leds/qcom,spmi-flash-led.yaml         |  1 +
>>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml    |  1 +
>>  arch/arm64/boot/dts/qcom/pmxr2230.dtsi             | 63 +++++++++++++++=
+++++++
>>  3 files changed, 65 insertions(+)
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250620-sm7635-pmxr2230-ee55a86a8c2b
>>=20
>> Best regards,
>> --=20
>> Luca Weiss <luca.weiss@fairphone.com>
>>=20

