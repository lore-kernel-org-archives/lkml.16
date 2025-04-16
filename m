Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95161598F4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744810962; cv=none; b=ngWYRKqsuSZDDfvy1UCz+92dIbXc0Rng76Fo2M3KN4TiXS2TLxkb40R7uFRorT2kbJIsmwJe5HLZ621owAJNWtx7Ek/OJbyFnYLkpr4SK51KQttpazzDeAcOUtOhD7aAyFlFfoidDjFiqYT5Leu/RuxjUMF15xOTzkrBpSxddPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744810962; c=relaxed/simple;
	bh=cu1hwgcAG1/lyg5yFhVpUwC+hLyuquvPpqbuQLeIMmM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gJPhB0Extf2NDzKYeVpsfzp8oeEAHbIhep0ic9znCTda131MO5ARXtpToKi7InarCZzBB2EYtAtayYk0IdHUuXWuN0oYOpMZhIkDYTDjGusRsefmivqAxq0O7oU2obHFDjSZyB6UiMftIR5o69mBGniNen5qBzOSWxvJvLa1HCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=nq27BIM3; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="nq27BIM3"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4769aef457bso68159131cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 06:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744810958; x=1745415758; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cu1hwgcAG1/lyg5yFhVpUwC+hLyuquvPpqbuQLeIMmM=;
        b=nq27BIM3x4k9bM626X7OV/MMObMRsnLmGnsf2gruIoHQO30pZOK4JYZ4TNY+DKgXE1
         84L1hjElYc3M4/QMCn0rOvYQpvax0u9dWhs3l9q3o4SLLidxYLj9BxGft5RXzQBbLPs6
         CqVB5qh4szB5kOrKpBHK0DhJ5LJYF9EnYoXAXe/tgVr5HQMeQSWVR3NHfG9SjMlFI4/G
         wF92ZT11dQey2mdg32k7dO4LA50mryXkhTLiHqZGO3bwlljVm6pvhIXRoSpIJONMEd7a
         EfQ1PPVP+8Wdyg3C5OkGXIrxdA+FbPWdh1LIZM12bPbUyxH/6YgUIxG1kC6WN51wyL8f
         8tvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744810958; x=1745415758;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cu1hwgcAG1/lyg5yFhVpUwC+hLyuquvPpqbuQLeIMmM=;
        b=JYBWfnj+G/5ulZF6QYMD1V8eamd3fKmrY/zvk/htj9sLLhLb6qDQJE4pKtCUZjGGzN
         7FRXGg4XNHLDIQ2FEX6NOpm+3a13CEpZkf8DR6h/ttektCcrKM8AOTpFv9tT8Iq6cEhH
         YYpkkWqruJfTKj8hnOXIjtKuMV4Heo8m9BO+uIwRXZ+fq3SSkedKYYEeMXixaf8cEhj4
         FNMEDnlfbo96cPHCJ4pACxnEhyi1ofVdIBsqkYw+s6a0LSD7YLRvouWmdAX+zPVvx1ae
         PTKWL8MnGF7AC1YDQHsH4m54JYTX4V50HAQ1DjkaCLv5cUVJ5Z2Qqj1NvoaFL46gAUaj
         yN+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/aZZqO/w6eCeLXWJIKf7RUXjzObrc29Wfd+SXfeXnhc7Ek/3DrauAkfgE9k0fW8zA1+IyszQLqcsmS+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy73euIczQisC3fTn4lSZQjmQMFBd0N1fwGQ+/OsOhE9k/lnaWR
	2aLNtr1XTumOu95+uYNQDm0gnBEzJ2Nan5fG9zWrnchBqzLnyeLm+ZJihwcxGE8=
X-Gm-Gg: ASbGncsV1khUf7Kib8spD1rhyuuI4Uv3tjqD70gst6NNGGL4KTgsG4PlFTcGOZwr91K
	VCpdAfirrRVqmELNnru2Hk8VIgNO1OgjVkkrnYN1ykP0tM1IrcUWpY/1j0RFM/D0fYtyQX5f7/M
	E7VKvSLuJrbXGTS/ut5nghatdfbs5sPwmWvRZG9wvtqks5XLJdUnB/hhBz6G++cmlTFyUWcR3X3
	TVtNt7cMe2OQMsDZFxuVlhY4WU1dx48tnP/3W55QRHRSGytoxRw0Vbn3GtedrFmPSz8Fngd0cuD
	z8hENtB+hDGHgyeUA/g4IljP+WPlyYnQcRm6emVm8HLKSQ==
X-Google-Smtp-Source: AGHT+IE/Z29VG3gT2+6rvTenOSNxGyAWOb6Ti3OyI7fAKZIAmEM2rbxTc/8xC7xoiOKGeoh/P504aQ==
X-Received: by 2002:a05:622a:1447:b0:47a:cc04:aabc with SMTP id d75a77b69052e-47ad80b4f4amr28281461cf.21.1744810958243;
        Wed, 16 Apr 2025 06:42:38 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:9913::5ac? ([2606:6d00:15:9913::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb0b82bsm108390751cf.7.2025.04.16.06.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 06:42:37 -0700 (PDT)
Message-ID: <2d9bac728c5135fe3236f6f9fa55a3cb5739cffa.camel@ndufresne.ca>
Subject: Re: [PATCH 05/20] media: iris: Send V4L2_BUF_FLAG_ERROR for buffers
 with 0 filled length
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, Bryan O'Donoghue	
 <bryan.odonoghue@linaro.org>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Stefan Schmidt	 <stefan.schmidt@linaro.org>, Hans
 Verkuil <hverkuil@xs4all.nl>, Bjorn Andersson	 <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring	 <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong
	 <neil.armstrong@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Date: Wed, 16 Apr 2025 09:42:36 -0400
In-Reply-To: <0241cee0-c121-3f30-57a2-f1d15b5e0839@quicinc.com>
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
	 <20250408-iris-dec-hevc-vp9-v1-5-acd258778bd6@quicinc.com>
	 <b857d1dc-2b21-4b93-89db-808c5dd4035a@linaro.org>
	 <0241cee0-c121-3f30-57a2-f1d15b5e0839@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le mardi 15 avril 2025 =C3=A0 10:01 +0530, Dikshita Agarwal a =C3=A9crit=C2=
=A0:
>=20
>=20
> On 4/11/2025 6:21 PM, Bryan O'Donoghue wrote:
> > On 08/04/2025 16:54, Dikshita Agarwal wrote:
> > > Firmware sends buffers with 0 filled length which needs to be dropped=
,
> > > to achieve the same, add V4L2_BUF_FLAG_ERROR to such buffers.
> > > Also make sure:
> > > - These 0 length buffers are not returned as result of flush.
> > > - Its not a buffer with LAST flag enabled which will also have 0 fill=
ed
> > > =C2=A0=C2=A0 length.
> >=20
> > Any buffer with a zero length must be flagged as LAST, else that buffer
> > should be discarded.
> >=20
> > Is this another bugfix ? Feels like one, processing redundant packets.
> >=20
> > > Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> > > ---
> > > =C2=A0 drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c | 6 =
++++++
> > > =C2=A0 1 file changed, 6 insertions(+)
> > >=20
> > > diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.=
c
> > > b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > index b75a01641d5d..91c5f04dd926 100644
> > > --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> > > @@ -377,6 +377,12 @@ static int iris_hfi_gen2_handle_output_buffer(st=
ruct
> > > iris_inst *inst,
> > > =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf->flags =3D iris_hfi_gen2_ge=
t_driver_buffer_flags(inst,
> > > hfi_buffer->flags);
> > > =C2=A0 +=C2=A0=C2=A0=C2=A0 if (!buf->data_size && inst->state =3D=3D =
IRIS_INST_STREAMING &&
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !(hfi_buffer->flags & HFI=
_BUF_FW_FLAG_LAST) &&
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !(inst->sub_state & IRIS_=
INST_SUB_DRC)) {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf->flags |=3D V4L2_BUF_=
FLAG_ERROR;
> > > +=C2=A0=C2=A0=C2=A0 }
> > > +
> >=20
> > Is this hypothetical or does it happen in real life ?
> Yes, it does. As part of flush, firmware returns the buffers with 0 fille=
d
> length but those shouldn't be marked as ERROR, same applies for buffer wi=
th
> LAST flag.
> This conditional check make sure the ERROR flag is associated with only
> frames which are supposed to be dropped/discarded.

informative: Due to legacy behaviour of MFC and Coda, you should never
push a zero-length buffer without one of LAST or ERROR flag. It may be
interpreted as last by some userspace otherwise.

Can you eventually write some doc on the double state machine you have
? Having two state in a state machine makes reading the code quite
harder for reviewers.

Nicolas

>=20
> Thanks,
> Dikshita
> >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > =C2=A0 }
> > > =C2=A0
> >=20
> > ---
> > bod
