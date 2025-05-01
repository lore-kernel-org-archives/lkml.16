Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F193E2EAE5;
	Thu,  1 May 2025 13:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746106705; cv=none; b=CbHOhOov4DPiOJ7CI4tCvVP/2r/gFkul0Fy9V0lbF2FAJpKWd+jhPCdpSGGdzlOkI8B9pVI8ncBDKUD3gXWAvglLP3swWaCkQw5VkZjMCKcECMpi+Sdf+nfkHQyUdpWJS5gskWJCmjlSOCMd+qZbOAaawKvEd8+Kl2xuRb7zL3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746106705; c=relaxed/simple;
	bh=8jls0qWQUdp2+5lB14At3M1sZB6vPtFKeEreLhlj9qE=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jGm8wzyRfJXSqhwEGF3rQS6msa03sH3ScVjIfXPx9Nr/31HtAVDSAu4mhHD8IB1KZj1msHrsJ892dKXPljkE3xLMOvWGNE1ObSYVvUpi8jb13GRwk0zHcT27uHd4JWu/pouSni4GQfMvIUfXS1iIJUMbB+5BMSsN/Za6T6ScwsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYB2pSKM; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYB2pSKM"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so893091a12.2;
        Thu, 01 May 2025 06:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746106703; x=1746711503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jls0qWQUdp2+5lB14At3M1sZB6vPtFKeEreLhlj9qE=;
        b=MYB2pSKMXvGRSAtDIrVMyM2tovZXkMHXHRv5fB/c16XMDiprUhDBuEgonvjhclrWb1
         Ldjazc5HxDplYYmwfaukh8DK+ck6ADzQJ6LIVxFMDWB+jHFpssGwYZsWjxpBZ+A2CtqA
         NdgTSwtaSvSKRD1RoE4iQRgw4Yx4nWFm3Wt0TEsr5MtM79CDSJAak8JteMoxAG6o/lKC
         1+bvmfgsZyIVBJqJzP0dZ/G9aDyTh6EbR0VBHmjG98ovTVqvMh/wusD5mv3UB5S1qmVl
         3CbKxvh+wYc6sf/U+i7iTnnULtjZdbbrYiOPZ0Eg0rhUZFddaLYhpRRRR49LVUbevzhb
         aOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746106703; x=1746711503;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8jls0qWQUdp2+5lB14At3M1sZB6vPtFKeEreLhlj9qE=;
        b=cyaoW3fh9TWVbDVmLIxDjYEIJvBzZ4h3+5YgLewqTw8DkJi1HWHzZ+vjRLpEGzoVzF
         QnvWunEJlsn84/39tvsIlBsQHKLqY0+cqiQM95pvswEfNx+3bO5TcLKC2ClpBxVpMzZ4
         FXkRYrOpXiHvAl0ZbOyMUS6RsDNxDpFA7taraOvq8jaEipOlAgYnjNNBM1DvZigbjVGA
         E/1YZJ5QtxbSp5J6U/aFHQiVoDzgNXSnIXiZLYIESDtQw5dUGmbUQUTZZftXklqDUb1B
         K2ITisv9DtVF5EA/iB4BtAcYPgjP7YMI4f5zd7IY2XOdeJlonV5Mn55/9gS2DFj+Fqah
         E8Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUSXP2myfVyhQITLuyL3Bng42sS+LCvqfRirJfsNJzmuSu15g/yQAANv0luMkGpuD8G8bGbGFoszkxNLocRwSo=@vger.kernel.org, AJvYcCVMAFa2wyE2eDb3uhes3KagrK0csrH4hKle8vKP7IcVCkgGGE7w0bDCYRHfj4UjCAT55y7btL85e7AnQEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRST/dcNr0fwil6LvmyyLCzL2D1c+BhzXJx0FFbBeJ/fBrII2U
	DwtNKlD4gBXU31aZFw+FgXtLiPJ+23YX1hGIV7c4zSVn9qz1hWNl
X-Gm-Gg: ASbGncsF5pYvvFZCXzfkRp0SBQ+N92aHHMnP6FNJWGc3O5a+UnvlZixHLaCEDygbMMx
	SZonUDHU2XrXaihKkSiy9oNsaA1iMms9rUUWbLW1EdSdP8XZyhdvFkFwRZ+2dFnF3gPyhkI0QfA
	4z5BhXcHV2N2u7KheyDlItp398uksrI5yzB4sWQjOimpExn/IRkFeu5u8aWiW1TKd02FHN+Jiqc
	o54Tn5Vv4f7feCXixLA0t1r/5tVyV3esQzd74kGlNJxSCiwyGkYl7kI8Oxmf7kdZVDf0yKqlH2Q
	bWnDl1Y+8dHl5UgWBiCpZjqlLze6JsUCuqOXnHMbgD/f3XTha7fJwovyE/JJRs/6TatRJnAdCsa
	decfB9ejWFQxQPr5HDcRDDxY=
X-Google-Smtp-Source: AGHT+IEOyrBC6CSEFDbo1zaQsu5fNDs0XVnQqfz8Y2v6dmdVFzouE6YD1S6rTMYXCPJfXkXg+v921A==
X-Received: by 2002:a17:903:3d06:b0:21f:dbb:20a6 with SMTP id d9443c01a7336-22e041089a4mr50264955ad.33.1746106703039;
        Thu, 01 May 2025 06:38:23 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bc7b350sm6309785ad.196.2025.05.01.06.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 06:38:22 -0700 (PDT)
Date: Thu, 01 May 2025 22:38:08 +0900 (JST)
Message-Id: <20250501.223808.669243726185352431.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: miguel.ojeda.sandonis@gmail.com, fujita.tomonori@gmail.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 a.hindborg@samsung.com, frederic@kernel.org, lyude@redhat.com,
 tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 aliceryhl@google.com, tmgross@umich.edu, chrisi.schrefl@gmail.com,
 arnd@arndb.de, linux@armlinux.org.uk
Subject: Re: [PATCH v1] rust: time: Avoid 64-bit integer division
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aBN2MMaxGrvhF08W@Mac.home>
References: <aBNzIp9UF7GZVYLs@Mac.home>
	<CANiq72m8RfL5g9kmAhZdZZbrpDschrXf1yJVvkWmvMzdnMaSvA@mail.gmail.com>
	<aBN2MMaxGrvhF08W@Mac.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: base64

T24gVGh1LCAxIE1heSAyMDI1IDA2OjI1OjA0IC0wNzAwDQpCb3F1biBGZW5nIDxib3F1bi5mZW5n
QGdtYWlsLmNvbT4gd3JvdGU6DQoNCj4gT24gVGh1LCBNYXkgMDEsIDIwMjUgYXQgMDM6MjI6MDBQ
TSArMDIwMCwgTWlndWVsIE9qZWRhIHdyb3RlOg0KPj4gT24gVGh1LCBNYXkgMSwgMjAyNSBhdCAz
OjEy4oCvUE0gQm9xdW4gRmVuZyA8Ym9xdW4uZmVuZ0BnbWFpbC5jb20+IHdyb3RlOg0KPj4gPg0K
Pj4gPiAgICAgICAgICNbY2ZnKENPTkZJR19BUk0pXQ0KPj4gPiAgICAgICAgIGZuIG5zX3RvX21z
KG5zOiBpNjQpIC0+IGk2NCB7DQo+PiA+DQo+PiA+ICAgICAgICAgI1tjZmcobm90KENPTkZJR19B
Uk0pKV0NCj4+ID4gICAgICAgICBmbiBuc190b19tcyhuczogaTY0KSAtPiBpNjQgew0KPj4gDQo+
PiBJIHRoaW5rIGBjZmdgcyBtYXkgYmUgYmV0dGVyIGluc2lkZSwgaS5lLiBhcyBsb2NhbCBhcyBy
ZWFzb25hYmx5DQo+PiBwb3NzaWJsZSwgc28gdGhhdCB3ZSBzaGFyZSBlLmcuIHNpZ25hdHVyZSBh
cyB3ZWxsIGFzIGFueSBhdHRyaWJ1dGVzDQo+PiBhbmQgZG9jcy4NCj4+IA0KPiANCj4gRmFpciBl
bm91Z2guDQoNCkknbGwgZ28gd2l0aCB0aGUgZm9sbG93aW5nLg0KDQojW2lubGluZV0NCnB1YiBm
biBhc19taWxsaXMoc2VsZikgLT4gaTY0IHsNCiAgICAjW2NmZyhDT05GSUdfQVJNKV0NCiAgICAv
LyBTQUZFVFk6IEl0IGlzIGFsd2F5cyBzYWZlIHRvIGNhbGwgYGt0aW1lX3RvX21zKClgIHdpdGgg
YW55IHZhbHVlLg0KICAgIHVuc2FmZSB7DQogICAgICAgIGJpbmRpbmdzOjprdGltZV90b19tcyhz
ZWxmLmFzX25hbm9zKCkpDQogICAgfQ0KDQogICAgI1tjZmcobm90KENPTkZJR19BUk0pKV0NCiAg
ICB7DQogICAgICAgIHNlbGYuYXNfbmFub3MoKSAvIE5TRUNfUEVSX01TRUMNCiAgICB9DQp9DQo=
