Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A432571CF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744962007; cv=none; b=oe4zojaaNRKDbEOI8/foUK6y+Wy42C6zOIivwnY7pSAEAghzAtN7PFPgw2H/+5RGvAlKcwPbXi3jfH80n2dnn2JQbbZ3ATC4Lo8xG8WNswr2b/ufRUOmyeKTnATJbxIF3YF7tm5vj8FLeAPugDd8bz1gZ2ek95ZDpSNqZhwN2cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744962007; c=relaxed/simple;
	bh=tkmJ2/zUYp0Fc3KQImo7xdJUrkMqZsLuifpe7h36Wac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YwP19bL7hddaMinLnMzB5qHAwfj7xPGZpteP2ndO/26fjKfajJsTM6V07eYLelu4YpXtjghIoz4Wp1JIaMdJdaJskVqaB/TnSHZlCopRqNhzc23lfpLcqvalTflV383poj+mJWjcd9Qd+78/3xcv5mQ7G+gnIn9yqXu7EQsXuTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGzlt8xe; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGzlt8xe"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3d8020ba858so15084915ab.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 00:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744962005; x=1745566805; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkmJ2/zUYp0Fc3KQImo7xdJUrkMqZsLuifpe7h36Wac=;
        b=kGzlt8xespOJrotCLjwY5FpDk+vIgzDFbhgHPRx8AoiuVreiAez6WRZg8XucQwPJ8b
         mK6IQIccSEoyOhuGW9bYdK6j+iYBa6TQif7I+Hd7Cypk4dNUqRwFLCVgCApD8ffMXD6D
         kAp3JZ0f5AZW8Imkv8zdllcFnWZw3mLFbTONpb/JbaNBJXf7mqNqnfFvdOBvqAXSBOJp
         oYVp8YQuGjCCdS9E42EKkY+1d99BFxD4ZQa4ZEJ7ud4bvfbLDLqn4shCBk48lpwDs/9s
         rx0zZtmZKUJOT52Im0E7l24xoV/F60AZGmRCAJAFvERUUqx8AqlH/LBRzRpE5ac+3Co7
         3PKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744962005; x=1745566805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkmJ2/zUYp0Fc3KQImo7xdJUrkMqZsLuifpe7h36Wac=;
        b=w6jnJblIODQSdGBa2g0Zcsr5BE5hCN2coKYtn8U8VaWiQpVdnNU4E/MZb3tlxE1Zfa
         +Utix2/44L6tGMV2fzrOYeSvsdxKEMgMzpix+FTAHOkzkDOu/qNmdkv3E0oZBBf1GsRw
         9JjQADzu1KZI3sZLjc1y7CS9Ij8V7zGmFhJGRTLsvk5AdWrN0ZnK8ZABqlqA15UZkP5z
         Mjo8r7T+Tvyh1ndhSFPs+f7nKq9YZyyPBvunoiA9InG0gKneBeZ+2ij30LTbgxvzhZDf
         lLcL2hTxevNFHE5MBe3o4HbuJ7uoh7UPegiRES+M9J1SX8RNsn5XayHvTeM0yf8ZVosr
         x4SA==
X-Forwarded-Encrypted: i=1; AJvYcCW9xmdS3/FlCBO9eLSoH7NOzFC64GpeIOfocr4w6xoA8ERwAQ3E+mpKzwfp6bXAGIcUJpl9X9o0Gdl1Ppc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Yim1hvxo2cKwab2aIv1OfuKNom3rC+t+4eo+o857GNbfTxFL
	AlpnOhjk5GHR551m5kDX6Rqm7DGQqjLNf6lOUUSoGfPHenACvCgPupNIwvKjOwY6zy4R4hmA0J7
	c3WZ9ZeP4DpNvWVhWMLmYySQ2Eps=
X-Gm-Gg: ASbGncuQXulzglbkgj5JIwP6k6pUqBuB6knaJK1mRVtNO8abg5m3DKybshOPo/r+SwP
	sVP4m89ogdL/wNPk2wKQfMKev6vRnQIiE0u2sIF/7II9eiz0KkkUlTvc5JGS9zMTel5uMTIXWfk
	zY0y3yO5dibOIpnIcBeeu8
X-Google-Smtp-Source: AGHT+IErxKRVjGKLa98ewYSC6k/+9FJnAZxh+oixS1Arok3ASPW8saLU/nIW+BIPDJzHAih5cRtNP0OSREI5EHz24g4=
X-Received: by 2002:a05:6e02:12e7:b0:3d8:1885:837d with SMTP id
 e9e14a558f8ab-3d88fccc4e6mr16634145ab.22.1744962005298; Fri, 18 Apr 2025
 00:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415051808.88091-1-yschu@nuvoton.com> <87ikn5ygfd.fsf@bootlin.com>
In-Reply-To: <87ikn5ygfd.fsf@bootlin.com>
From: Stanley Chu <stanley.chuys@gmail.com>
Date: Fri, 18 Apr 2025 15:39:54 +0800
X-Gm-Features: ATxdqUEgID4JwE8npaubEOgK_7WVdVRuS4qC3ntc2D_hDo24wStrJHPuryG7fK4
Message-ID: <CAPwEoQOuvwzf+VcXJpx0LB0v_ZdCoB=rJW_ekHYo6ATY57LYDA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] svc-i3c-master: Reduce IBI transaction time
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: frank.li@nxp.com, alexandre.belloni@bootlin.com, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 4:31=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> On 15/04/2025 at 13:18:06 +08, Stanley Chu <stanley.chuys@gmail.com> wrot=
e:
>
> > This patchset reduces the IBI transaction time by the following
> > improvements.
> > 1. Receive the request in interrupt context.
>
> I initially had a few concerns about that, especially since the wait
> periods were bounded to 1s, but actually we are already in the irqsave

Hi Miquel,
The poll timeout is 1 ms. Normally, the IBI can be completed in a few us.

Thanks,
Stanley

> situation when running this code, so your series might not have
> such a huge system-wide performance impact in the end.
>
> > 2. Emit the STOP as soon as possible.
>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Thanks,
> Miqu=C3=A8l
