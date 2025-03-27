Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E966214237
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 12:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079313; cv=none; b=FVyOE+Ol2wl8aWAx4NCB42TQGu7BKWF78+mu7Nmlr40fiIlGC559SrnAc2exLxixHQCt8qw+U/wYsZv9eGa6HY6Rvhg2IfA3UhNU7oO8xrp3jgcAFzkT/oi8/8jyFcOdxWAu2J/ZngfFM3g5cxcsRZ5zBgUwU8EAOMvzJ4LgAhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079313; c=relaxed/simple;
	bh=rTUk5WsXR6uaQmtmVpjNHsbtIr+WlFlJncQhJeTUUpU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=knoTWEDB4mz6q1xhALuDu+c2h2u5qKH1JOT9QGZv26F4BLM30UFjQOZs6mP42Az3o/F274JSh8Dqu6Kh0SEVDwsC2w/FK0fTKh+opsQDuwkKEPgmAiDL9NcmsJM8ef5naXTfCuXwflgSnYJ6brjtBuVjuc6qS/keLQjRCn8ZkiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NGP58XlI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NGP58XlI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso6802085e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 05:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743079309; x=1743684109; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTUk5WsXR6uaQmtmVpjNHsbtIr+WlFlJncQhJeTUUpU=;
        b=NGP58XlITYgewmnUz3C5CEsnJ90a7XtwoWFh2GZRC4H3o+r8nni8xsVysctoNM0pDx
         eKLdB7bYq09MnHMo+018Ng6T6Bd+sYQMLEsYCNkGqxcwqWXLG32UscFqrWZnOocQMM1r
         zIbBGUoWg/axjCUrNJqRKR86xNI/Er/23e1YAp5XgaPBlbtjpaFPorQdreacKWPf4wi9
         4cfv+wBWSjPDXz9noy5kN/v6ujGHrxGqxvHAY9SNTkHwrtGeu4zLIRbEia+3sFN/Bwd5
         Ar29oFRc/nqfYVT7ljk8skQU2EA2ovUAXXnZioCL50q85XYALdu7pXFpusK+B8Ywj87S
         jRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079309; x=1743684109;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rTUk5WsXR6uaQmtmVpjNHsbtIr+WlFlJncQhJeTUUpU=;
        b=FPvWa6ekFmBfTCENm+leGf8N7/+Zxl7pA44t2sOdTbyhxdQXvCnm2cQYvgVX3RBw37
         B8Uvu2Jv9lkynPAZolYGlwX4P3YDTpRzIn2PRDFENX3ortP3CphYj1ilyQ0cqV6Pi7J4
         ItSb7qI1ox7UMa8jOUNdHlegW7iRxQNyhJYBHGNXOvM6z9YcUzT9+hJ5nT6LuTGCfqpG
         LfEfYB0Rp8Si+bxcCBzIoKfbb8Zdl2kHxpVxcAWgyQhBrE7g9bdUhkEy1DcelQfflB8I
         UE+Lb+mijm4ydl05Arj85T6lUe2AbRUdNG07yhtzf7e44QsleIDgKfJTkRh4b8BAtU3D
         5ayA==
X-Forwarded-Encrypted: i=1; AJvYcCX02t0MPEUmgI6Ry9lyqXU7Gx7R+MuEefuVdnTcaEN8pTNvvJT4oEHY4M8gtHwsw3ApK95K0lWa2SNrlh8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe06JFyA2vbtU/SWYuIm3DFdDTn8uDXxIFT1hFD/skyiOnMiFE
	thZ/YuL1rqmkuCJ3YSnm7XCSQqvARUzqxPf9yTG9nxLDi1OMedTGyTU/2OILVSo=
X-Gm-Gg: ASbGncu4cjMDAjwxcEULG/RfbGbLs+UGG9g+eWFfyBWRj31fq3oK40QSwPwFvAqMbUB
	5PromTwT3kVNyXT1iW5mdG96gCH7qciLdE0lKs39bNW+FgMfpkhb0NHka3vA1U14jKYIV2NXv/A
	JYvj4kyvIQAqkE77ZnN+pgiFsb36reOwv0GbzxvKm7jlF0UpfV3IDfmLap513c4QWwqkyIbzxu3
	DdwSwLoW5fr8U5i2vpEw1Jwb8c8FMZS20nQlpiXUDGY/sIFTwbdfimN+OIS4/9jlLiQwSQZsGIL
	fxkMwM1l0DE76lULJ0wubgzAwd+G6heXbpJyFLdxcAVqHXlw+Q==
X-Google-Smtp-Source: AGHT+IGWrkmnwwYBa5Bvx8VGNmhRtptYZl223u01AmKMJ5pNwx5tLvmrcvvV5SU1hmSMut9pH5TgMA==
X-Received: by 2002:a05:600c:4f94:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-43d850fd6aemr35034475e9.18.1743079309513;
        Thu, 27 Mar 2025 05:41:49 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dedea3sm39373785e9.3.2025.03.27.05.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 05:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Mar 2025 12:41:48 +0000
Message-Id: <D8R21NO1IN43.1E4FD7KG9Z4KI@linaro.org>
Cc: <srinivas.kandagatla@linaro.org>, <lgirdwood@gmail.com>,
 <krzysztof.kozlowski@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <jdelvare@suse.com>, <linux@roeck-us.net>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] ASoC: codecs: wsa883x: Implement temperature reading
 and hwmon
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250107114506.554589-1-alexey.klimov@linaro.org>
 <3e08b501-f8d0-4e68-874e-b578e7c82c47@sirena.org.uk>
In-Reply-To: <3e08b501-f8d0-4e68-874e-b578e7c82c47@sirena.org.uk>

Hi Mark,

On Sun Mar 16, 2025 at 11:33 PM GMT, Mark Brown wrote:
> On Tue, Jan 07, 2025 at 11:45:06AM +0000, Alexey Klimov wrote:
>> Read temperature of the amplifier and expose it via hwmon interface, whi=
ch
>> will be later used during calibration of speaker protection algorithms.
>> The method is the same as for wsa884x and therefore this is based on
>> Krzysztof Kozlowski's approach implemented in commit 6b99dc62d940 ("ASoC=
:
>> codecs: wsa884x: Implement temperature reading and hwmon").
>
> This doesn't apply against current code, please check and resend.

Just for reference and for future, what should be the base for patches?
linux-next or specific repo/branch in audio asoc?

Thanks,
Alexey
