Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4072A19539F
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748346375; cv=none; b=W5Uvlq9ZnTAv/JhxomPOJZRDGNs881cWm0bfSGUKiuyN3DpkOyd89AjA5QTiZ88LsvsimIDE0wjS+OLQUVJqWf19I3dTx5Pph3tacQBsp87NxloG18F6c6/Ym19TgdIc0z6Big/bJJ3fV5ZRgBvSO4FGVJdst/es0X8Pd5XOUuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748346375; c=relaxed/simple;
	bh=hZgsNJN5U6euHAUZEHEmUPgEJHbDN2WW54ZAPUUNn8I=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Zq+oeceTBaBRGcpKV9PXlyalmOuPA3po8rPZOpsnONHYN6iQAKWL+u/NLbmnXF1w6bgELHokGH0a87aUYtz/c7jhjw5meDhzEqjVuXsfgwpQdvSYiQ4WOp8zQAEdIdWssW2pftXprbRN6w9DXI5pjAm86BLPk3FTGu494J1QWqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org; spf=fail smtp.mailfrom=openpixelsystems.org; dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b=zhWlcXvX; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=openpixelsystems.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openpixelsystems-org.20230601.gappssmtp.com header.i=@openpixelsystems-org.20230601.gappssmtp.com header.b="zhWlcXvX"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a37ed01aa0so3228650f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openpixelsystems-org.20230601.gappssmtp.com; s=20230601; t=1748346370; x=1748951170; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZgsNJN5U6euHAUZEHEmUPgEJHbDN2WW54ZAPUUNn8I=;
        b=zhWlcXvXXbVPPhRC9534eIKWVRk0AijQqeFnKb5xZRtuhQcxN4dUpjyptiYYWxGdW8
         OZ6u7m3mWDuJDik2DK1VEEfhGtC2jOEjzN2LS435rYvaOJTH4wkUNEVRodpMRTx/x4K6
         DwCQ5TWyrNSY9KX+rvj2ylsPsKgSun4znHnivkye0OjgldDLOEem5IKQT/eVesc7lPHb
         LlV/HQMdbdUzXNPMqpQr/gfb7NetSeWSXMy1OcuyRszaSrFL1g+R3riC6nd4AUXEs/yJ
         YdN4vIedFilyvFPJe56hC8KSmk17QjJO2cFoMt1pkkKT/DbNwmMnZuHiLE5f8UATauB2
         Mmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748346370; x=1748951170;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hZgsNJN5U6euHAUZEHEmUPgEJHbDN2WW54ZAPUUNn8I=;
        b=vUWaDyNpxyzDmUFG5LKLLfNkUde6OmAWBRYwM+t0QQuPCCanPyvsBuB2pn7Smu7hKd
         NH0jALXorhFVegve3yEu7MUszJsVIRDVWBSlhNIVeFJDj0gWrm7CJKDK0z0A12oqWVpn
         H8+ev76/LVP1akbucz7IbSwUmQZ4hEtCq2iz0AZnLSXGdmkdwNyibiSoOsfzc/zHG05+
         XNl7Ecw5Dx5HL/XsBFjiu8IadtR5Hhnz3o25x/MgUY0lYIQ4hTLmX3ORjfyMA5yzd7DB
         SdfmDexruOwkyBHZwXk5pE/Evk/hu5H5LWNngliRiH3eIaOAHrM8v4nweiXF2x49uwup
         r2Vw==
X-Forwarded-Encrypted: i=1; AJvYcCV16MxXcIteGeFMe6z+ixXqohufS20QGnZWRKJtNEnLGs6i50V8DxoXXKp1PEi18wGCJDfJtxKEC1WQL40=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf5u50NmVUQlvKPNou4jT78hvjX2kfyJ7JZphVrkhpUaefUb9z
	u+NVo1KtMOAch7H8F8Pmmt/gdF5mF+qeEJZkS0dSjbUFeb+m6hec6fveGn2sC1pSsWg=
X-Gm-Gg: ASbGncuyu3pu7fCnVq1KDZSByrzNCKz6OEWQIhCWr3apaL4+stCak2UuKNE89EyEMtF
	JCYhTr6QAj1h55Zkv8E9v48ZVkILZ45/toOBuZaVS86QT3fIw9vX50AMbgXTdYvWkmFkpdCDosA
	BXCW0di3X4SHjFuVzQn4jnZ95GagQuVPxk2iB0jEJMYWqtsz+xFPTO0B7ooalCRMVM8H8TtCoWJ
	FX3JwQjSbGhF3iGHr/OjBsYaBP9W7Iz0VSIC8o1+CSLio7Wp7000WxY7bvjzGn+V4UJ8bm+q9La
	beJiuR/GaYIn48eTAkfeBKUcdvgPBbUzkSFPwylRvv9NRWipPez2pqgY9msZYTK5o9wYwNpqYtV
	eCITEzJwo6cj3rvgtVSpEn089e2rmWyoewJuT7B8=
X-Google-Smtp-Source: AGHT+IEJksL9yUy4jX+PG0AKVXuGsMzofM/R8YjCchkDDQuXA/zsN6zJKbbWLD2SqIYtzpiCCZu9+w==
X-Received: by 2002:a05:6000:240d:b0:3a4:d6ed:8e07 with SMTP id ffacd0b85a97d-3a4d6eda68cmr5840366f8f.32.1748346370483;
        Tue, 27 May 2025 04:46:10 -0700 (PDT)
Received: from localhost (253.124-78-194.adsl-static.isp.belgacom.be. [194.78.124.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcced4713sm17270135e9.1.2025.05.27.04.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 04:46:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 May 2025 13:46:09 +0200
Message-Id: <DA6X2A2JC57H.DK70D9XL9C8Z@openpixelsystems.org>
Cc: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <peter@korsgaard.com>
Subject: Re: [PATCH] ASoC: tas571x: add separate tas5733 controls
From: "Bram Vlerick" <bram.vlerick@openpixelsystems.org>
To: "Bram Vlerick" <bram.vlerick@openpixelsystems.org>, "Kevin Cernekee"
 <cernekee@chromium.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, "Kamel Bouhara" <kamel.bouhara@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20250527-tas5733-biquad-fix-v1-1-0d3d941700bb@openpixelsystems.org>
In-Reply-To: <20250527-tas5733-biquad-fix-v1-1-0d3d941700bb@openpixelsystems.org>

Add Kamel Bouhara
