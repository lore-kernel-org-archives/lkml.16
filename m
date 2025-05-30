Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE633FC2;
	Fri, 30 May 2025 11:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748605810; cv=none; b=jTn0VYedpDbKgLn9KAteFuL10hDSNKAlZa+JsgjSI1yoc/yI9BzvpuFCF2uHz65Ao2qhjkppupNv+FTqtOVufmmfB0QYSV5Mpl3NTn1SsURNkRPAgChpFW9ugIOG9wbySClHyiNAj9LyiVb7fvWvbGJcnv58QUiWX3A+fsha8nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748605810; c=relaxed/simple;
	bh=idu8Ow8BMuBX4wTfRDd8vQr0HjKab5Y2sMtyPt5uE1Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S4ftujbReRW9iAJTaw18pD3o/PWL6ODSp1FdVXlDIz2DVwmUs2Sw0XTPH3ljYBRn46C/VG956AZQpn+QInCd44OZ2sCzwnUUNtMRUQmRSGfGRtZKS2uMGV0IvlQi9czKr/dBr5L4AFQCDt2mgYTv/rJPeH76H/EINYbYm4ALBPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=UVxmlLZn; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="UVxmlLZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1748605797; x=1748864997;
	bh=LK8UUp4Bx1tCTim2vLQR0cYMads/iCl1Xz8T7cjEVNs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=UVxmlLZnUq4kKJb23XiaT2Y5Z/UQqHTcA98TrVRs2YaNFwXc0rsjlUNXRLJtsphaF
	 nIth6y1QjaUXzMa1n/DHSC9Tg859t/qW+gH03E1usZe+WCCBxT8q3tmliOMubAoA8z
	 H9L/AL4zkZASd7jZA9ODf0FsZf86EecIucpbSiBgmzzoYA66sc915qh5ivWdxO1oIw
	 9ygNEOXhyyOp5FJkD1J3GtbaVL8NRplRYdmCONd9Ruhnh7TG5DlIfggKgSAebWONHr
	 B5tAgie71cMTVRsD3K9kWLkCzFurYJAWcUFZtydJ7v28oiHtBr+IVV+mC1J/AZt1j8
	 X28Ci54q0aDfg==
Date: Fri, 30 May 2025 11:49:52 +0000
To: vincent.knecht@mailoo.org, Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, =?utf-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 2/4] media: qcom: camss: Add support for MSM8939
Message-ID: <e28b518b-26ac-4d3c-bfaa-21a7cce63366@nxsw.ie>
In-Reply-To: <20250530-camss-8x39-vbif-v3-2-fc91d15bb5d6@mailoo.org>
References: <20250530-camss-8x39-vbif-v3-0-fc91d15bb5d6@mailoo.org> <20250530-camss-8x39-vbif-v3-2-fc91d15bb5d6@mailoo.org>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: e039232186c158fc9bdd69f31340df6e1336c81d
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 30/05/2025 10:00, Vincent Knecht via B4 Relay wrote:
> +=09    camss->res->version =3D=3D CAMSS_8x39 ||

This is not correct - it should be 893x since 8939 and 8936 are ~ the=20
same SoC - probably 36 is just a binned version of 39.

Anyway the x is the least significant digit.

Please fix
---
bod

