Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934FD1876
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 03:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745899095; cv=none; b=QyMjkkD5fLNyUahjZdYKWmttOqJoriTEutoo+0gxxCUB7aB5wv/E7ZW9+rMAET5tCotEa3KfhGsvkkx5K3Tkfr+D4iKQNnAaDOo+9oLXzVewXAJD/Uiwww/SlvhJUPY0NzNelYYQ+rWfVxO91F7Wpbgf9Trw3HI5uJo8e+l0dws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745899095; c=relaxed/simple;
	bh=AWEAszHixMabaHum7/doBO6Caip/PQgW7hNPrb1Yb0c=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=axEeLvFZww+4/7j/mSwJBQ/JPKPpdE4jMJJxBaK91njE0SKoUT9JBlqLPWnUizOswQhXFO2waW5uZhBh0xE2jnex2kdzgg0TrBTc1qkCpTqEXC0jpGlQoPmAL0fPfaJC3TuI70YsDhlk17pcdXtP/fMqivbs8vDyXte+E4wxcsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkFvo6e+; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkFvo6e+"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ee651e419so2850088f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745899091; x=1746503891; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AWEAszHixMabaHum7/doBO6Caip/PQgW7hNPrb1Yb0c=;
        b=DkFvo6e+EXyXuAR+971bx89uQ3zGI6I0yC5u6uayOMvPjJT2W+ka7fYWBkmbVv1sVA
         Mfq2nR4k1tcl4EY6cJxNolyr+xDKuBirrJ3zUoHhuCOG7jntzbWaKLZ3MPKjufcECeAk
         1EbODeyPwgl3gDZuttddrCuQdwv9m3B3KlcELKoG/GSaCbwyH6I/hnuue+0wB+0kMZTR
         bxvOFrZM0ZVO2fmI+sGx6HLUuMKkjBWLxqD1Zard9g2frKb5N6dRYxAVBYRIMUMSIF7y
         +pKVTgIqV5vDgThkwN9Ga70tDC5alB3uvl7/M4GMeF5Bada/jSDRC2zGUAbEWyP0gyIZ
         g11A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745899091; x=1746503891;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWEAszHixMabaHum7/doBO6Caip/PQgW7hNPrb1Yb0c=;
        b=dIlzvXyJo/rYJ80RtMPs5fB5Q8o4BbH6nBgBpR9iJHHOMHt4ggcNMAo6n5l1DkyNvx
         P+FNG7NU0g02KmI3IkbzXbiNOAqXJjQpVqNglhLbC5Hd1ZgHTSSE4W3jZ3g//q1uzVxK
         UNE2FszvmF+He+cwZUp7rSJwW/2RgcdyBgnTlNIlu3aMAU4HLrBvix2eC5616W1V0e85
         wWrQX9sprMdS47L/IaYaF8mT8DnN7WcoiOahJluuqPp76mapPiN6WEjmVAvWpYLk8VXz
         6ayKQq9SykxoXoU24WMYxRjWZ/Vi3XDm+YACssziTVXXz9msFipEsElpk4SqWFjcdNlY
         8ZTQ==
X-Gm-Message-State: AOJu0YxNmxaoDDhnW6MhEktGZnyFOm63ocBawPIMC428ty4AtKJCqwYI
	8xybO5gf5v8vn80Mi0fblQAhCmvEfeS0AeeV0wz6wsWbH+KKWed87nZ+oQ==
X-Gm-Gg: ASbGncsBIJINYz0E9aKaYKEO4z/fCjULJ+7H8Md3OAhCa/gadrfDNmatsHpZQTX19MI
	GBKmbx63gwDKNMKZg6/xN5dx3jDIyuq6NIf5e4U61qO3cOG7wrOfweWVfl+nDPUdyrWonox6bv9
	65LZWU7ACE0AV5utTlVlluD7zpp8ZP/ZNwdVMMfonotQnSAYG3JZ1lmEFRF393141jUOAD/SkKt
	xW2W1Tjh0HlfhU3XiZtpCSZDWy+ExapmGy177THKGHW/opsRzYWZcJR0HboquYp67ESybbYLXxu
	n34ZjYqi5Leb34NmreP1
X-Google-Smtp-Source: AGHT+IFFtMNz+meWKvqnaAOv52krr/e7GNjsBo+8cbhfdeUJmMGE1g73n0dA9AcHiLPqcNEnkgNCow==
X-Received: by 2002:a05:6000:1a8d:b0:3a0:8020:c5c5 with SMTP id ffacd0b85a97d-3a08a3c9b56mr904558f8f.58.1745899091297;
        Mon, 28 Apr 2025 20:58:11 -0700 (PDT)
Received: from ULRICH ([197.234.221.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d86f7sm172359135e9.32.2025.04.28.20.58.10
        for <linux-kernel@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 28 Apr 2025 20:58:10 -0700 (PDT)
Message-ID: <68104e52.050a0220.25c915.b635@mx.google.com>
Date: Mon, 28 Apr 2025 20:58:10 -0700 (PDT)
X-Google-Original-Date: 29 Apr 2025 04:58:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: rotanphelima11@gmail.com
To: linux-kernel@vger.kernel.org
Subject: Privatkredit
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

R3V0ZW4gTW9yZ2VuLA0KSWNoIGJpZXRlIEtyZWRpdGzDtnN1bmdlbiwgZGllIElocmVu
IEJlZMO8cmZuaXNzZW4gZW50c3ByZWNoZW4uIFdlbm4gU2llIMO8YmVyIGVpbmVuIFBy
aXZhdGtyZWRpdCBvZGVyIGFuZGVyZSBPcHRpb25lbiBuYWNoZGVua2VuLCBzdGVoZSBp
Y2ggSWhuZW4gZ2VybmUgenVyIFZlcmbDvGd1bmcuIEJldHLDpGdlIHZvbiAxMC4wMDAg
YmlzIDUwMC4wMDAsIG1pdCBmbGV4aWJsZW4gUsO8Y2t6YWhsdW5nc2JlZGluZ3VuZ2Vu
LiBLb250YWt0aWVyZW4gU2llIG1pY2guDQoNCkJvbmpvdXIsIA0KSmUgdm91cyBwcm9w
b3NlIGRlcyBzb2x1dGlvbnMgZGUgcHLDqnQgcXVpIHLDqXBvbmRlbnQgw6Agdm9zIGJl
c29pbnMuIFNpIHZvdXMgZW52aXNhZ2V6IHVuIHByw6p0IHBlcnNvbm5lbCBvdSBkJ2F1
dHJlcyBvcHRpb25zLCBqZSBzdWlzIMOgIHZvdHJlIGRpc3Bvc2l0aW9uLiBNb250YW50
cyBkZSAxMCAwMDAgw6AgNTAwIDAwMCwgYXZlYyBkZXMgZHVyw6llcyBkZSByZW1ib3Vy
c2VtZW50IGZsZXhpYmxlcy4gQ29udGFjdGV6LW1vaS4=

