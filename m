Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7776439FD9
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 15:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743608667; cv=none; b=tyJBGwhBonTcZoP30ITfhgFstX4u7a1SHnt1138Ng5KM78yhsChlNaj/87MKZdBHP4cidwjHzv0GCAyXwz8KGw4btzWCULAzCrrnuQfBV2cxXfN4DyIRl6lSvESJ0U/88wvds+BqR0Xb7Z+yroIVBq7BQ3tsHGTF73Hnaw6MH5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743608667; c=relaxed/simple;
	bh=a+jzbY8HG5fDsHMKsIn9+P1jaVjiV3EsjcvsWqE6Nnc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rrC2S2wQM4t2yfGwVvdiVqvxhllO2h8LlnrWmUZXdvD3GrtnE5N16bZrtysKO10h79HaKjqiDWVmzKB1dp30JhXROEiI8qAv+QUqIllcLKP7AYfkWSK1+TdA4azWaeie+H8nfcSdT/VVrWs23u9UBq5GbcL8kTDBsFfHFT6iGLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=qHVtGo2N; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="qHVtGo2N"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-476977848c4so67528671cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 08:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1743608665; x=1744213465; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a+jzbY8HG5fDsHMKsIn9+P1jaVjiV3EsjcvsWqE6Nnc=;
        b=qHVtGo2NJqhEI+lMJQEj+aNJf/XSiU4XeXq+EgzDWCFHrzXinI7wgzYwHSx7Ql5vr6
         kfgT/7JP3MpvwkNe+JPsw8UiIDjrgAPdJ2nYB2hzQllbdTzgqFWN6z03JWy/LpFWYmux
         GEesm5o6YjeIgl1x9s9TpHY163ENwP2Inf59cJJfZSJyi5erRkTalKKrsR1Bn8SRIy0m
         0LOX6smHR/QSghc2vHNLMPW4nMPaeiusN1keQldS1U5lI/DaVI+iWXBp1p7rsLxqenud
         B2P1ogIfJnXCOiN4ewtyaLE7PecFvv05yX6F8B2dOaRrkhk727BfnI74wVj+YI6XggwS
         U56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743608665; x=1744213465;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a+jzbY8HG5fDsHMKsIn9+P1jaVjiV3EsjcvsWqE6Nnc=;
        b=Cb8uMQKUKrEpuvDv+h9r6tA9GcrugjQ4kZe6Hs0vXMUC3Nxy1a+aDu0sB0LPyRjRf0
         nChSAPjDcL4kff83wRxlNj4LVH7GDorEn3SMZVw2MVvTtwhdc6fNgl8D/OpqI7rHKddV
         t9qLJpp/tIJjonMv+tkPo6VXTZ4YH/PW4VBjv7EdhVaTwxl04m3knrJDid71EvySsLOi
         fkLNicmVriSMN3iwsG1QmM65wArPBORR2dt7eOglHSTe0ryXfN5ImN7pCnVJn0qzx9fw
         3QaUubb5HaatJHjgyrGPymyxDC7vrMzqsjGAAWkiAOauimZyO9qp+tCvlgmjsT1V10Ka
         0w5w==
X-Forwarded-Encrypted: i=1; AJvYcCW69LLfyZestZ2xocw5C/C2lg/KaqVJRaFHmkw6VJdePdQEjZCn/3Z1v1+bUFWMI5IJqMXhMtLykS/5O1A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpt1lsHepNi5YGftSrtftaSUKVZlptFiIPyfBY/0/65v7d73B8
	E6oqoTlqRQsVD+o8x7QlpDJjtJ3NOiyhE5zD6SYnxIgA9XC1AWqtTvxN5VyIPv0=
X-Gm-Gg: ASbGncsJOGzlyKoBCoHQkuF3bkhqMNCABqlc4+Ek9LbjIn7r//FmJt+Ot9d7OsdqWgN
	wiidSa8GoHXuXIOtyvZQhIN7aFgLQmGNHlChGcN6dWjM/Fm6xOMjo1jXTL985Ldlji1HNuNnwY4
	SR9vyax8Jese1sZXKji+OL8vylqOYWt1NV3rHjPrA7jW0RVDqopKLqHbbYtokjBHlND8zNBvNYn
	ADA7pQ6hJPbR4rl3jlV/EbtOdMnfATyyWgRZzMwMwvpyP6Akjc546waWHa0MWEehFZ4x022/X7f
	SbaT2u4eCUPBxCSVjb7X0o/xdvVkgj8d8XLyuIGqifoxw65y3Q==
X-Google-Smtp-Source: AGHT+IEc+BZhUW+/6NwnShxb96e828exddiZl8c+iUpF+yyVytLTniyS9bVUuXTF/eUSpSRYwnxUUQ==
X-Received: by 2002:a05:622a:1820:b0:476:980c:109f with SMTP id d75a77b69052e-477e4b69912mr233296321cf.19.1743608665282;
        Wed, 02 Apr 2025 08:44:25 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47782a4a62fsm81446731cf.25.2025.04.02.08.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:44:24 -0700 (PDT)
Message-ID: <9f22aaa07b1fa11e7e1dee35598bafe5a3461ea7.camel@ndufresne.ca>
Subject: Re: [RESEND PATCH v0 0/3] Performance improvement of decoder
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "Jackson.lee" <jackson.lee@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com, 
	bob.beckett@collabora.com, dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	lafley.kim@chipsnmedia.com, b-brnich@ti.com, hverkuil@xs4all.nl, 
	nas.chung@chipsnmedia.com
Date: Wed, 02 Apr 2025 11:44:23 -0400
In-Reply-To: <20250319035034.111-1-jackson.lee@chipsnmedia.com>
References: <20250319035034.111-1-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

Le mercredi 19 mars 2025 =C3=A0 12:50 +0900, Jackson.lee a =C3=A9crit=C2=A0=
:
> From: Jackson Lee <jackson.lee@chipsnmedia.com>
>=20
> The wave5 codec driver is a stateful encoder/decoder.
> The following patches is for improving decoder performance.=20
>=20
> v4l2-compliance results:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
>=20
> Buffer ioctls:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not=
 supported
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not=
 supported
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_REQBUFS/CREATE_BUF=
S/QUERYBUF: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test CREATE_BUFS maximum buffe=
rs: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test VIDIOC_EXPBUF: OK
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test Requests: OK (Not Support=
ed)
>=20
> Total for wave5-dec device /dev/video0: 46, Succeeded: 46, Failed: 0, War=
nings: 2=20
> Total for wave5-enc device /dev/video1: 46, Succeeded: 46, Failed: 0, War=
nings: 0
>=20
> Fluster test results:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.=
0 Using 1 parallel job(s)
> Ran 133/147 tests successfully=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in 68.517 secs
>=20
> (1 test fails because of not supporting to parse multi frames, 1 test fai=
ls because of a missing frame and slight corruption,
> =C2=A02 tests fail because of sizes which are incompatible with the IP, 1=
1 tests fail because of unsupported 10 bit format)
>=20
> Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Us=
ing 1 parallel job(s)
> Ran 78/135 tests successfully=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in 35.015 secs

I'd be more confortable if I could get test report using 2 or 3
parallel instances.

Also, have you conducted manual "seek" tests, and stress tested the
dynamic resolution changes ? We don't have automated tests for these
anywhere yet.

Nicolas

>=20
> (57 fail because the hardware is unable to decode=C2=A0 MBAFF / FMO / Fie=
ld / Extended profile streams.)
>=20
>=20
> Jackson Lee (3):
> =C2=A0 media: chips-media: wave5: Improve performance of decoder
> =C2=A0 media: chips-media: wave5: Reduce high CPU load
> =C2=A0 media: chips-media: wave5: Fix Null reference while testing fluste=
r
>=20
> =C2=A0.../platform/chips-media/wave5/wave5-helper.c |=C2=A0 10 +-
> =C2=A0.../chips-media/wave5/wave5-vpu-dec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 361 ++++++++++--------
> =C2=A0.../chips-media/wave5/wave5-vpu-enc.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0.../platform/chips-media/wave5/wave5-vpu.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 69 +++-
> =C2=A0.../platform/chips-media/wave5/wave5-vpuapi.c |=C2=A0 25 +-
> =C2=A0.../platform/chips-media/wave5/wave5-vpuapi.h |=C2=A0 12 +-
> =C2=A06 files changed, 307 insertions(+), 178 deletions(-)
