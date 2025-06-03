Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31CC4315E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 01:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748913850; cv=none; b=vDePbaEoFCsqUar8dCidEBocg204bQHz5fgdII8qDJQiVb1A2n9p6qg2yuEiuenWMP2j25CllyIyh1pZElU3rY8SHV1GxKJK0auZZLQSVor/dilUZarbBQKX/9em4vhSSVJo+5UfAq1GuPOYqDkFq6sn2OdCLmI3J7yGGYuBWPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748913850; c=relaxed/simple;
	bh=OyLELClNgN245/Nq5nCJ5Miwt7BUMfEFOp/t7OKMqVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZtaR8kviE3NyLZtm/rMSYzY3oNnTKLTzqyAvFP0rxvgfEWc7X7TIbGhuwRGkaqr3zJeEL0RWspQslfkLph/N8STkA+ftOtrrMhnetI4ACewVfgwSLmYjr4VzW+9EeMPCO1g3MAaCrZOFreu/qqSCT/d9gASYrkNvyoNfU1joCsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4Owh0QS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4Owh0QS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HJj3h007552
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 01:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OyLELClNgN245/Nq5nCJ5Miwt7BUMfEFOp/t7OKMqVQ=; b=R4Owh0QSPpVvnXY0
	4aNzkkiJoiL3kpXDcKK5KeQxMLzBK/4/hrJ/YOmSNnXLJuzt8Zk5jKAUrNt5H53Z
	Hum2hNfkqS9FtxsSOwLo1ZlEzqAyS1MX1wR7NKU0DZwSuM2x4N+A8gdlJFQ1+vY9
	0aJjox03sLYUCAoz2Sy20IIIvhmj4QtLSvxgkJnps5Itm0KDlvo8xgOhJIHJdOjf
	h51r87pmsRjMfHvqbNXr9Pp8Wx7ZD1/7eFtfedz7s6/QgBM6FRJ2F/6wqkweZEPf
	vB+57KGZXEz4gkgGJNJorrbmgrDeL86tzNOkc9WdVEpekeWfU7eCcu4H0YFIiRWQ
	KWtlpQ==
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t8xku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 01:24:07 +0000 (GMT)
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-e812e064de6so3189242276.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 18:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748913847; x=1749518647;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyLELClNgN245/Nq5nCJ5Miwt7BUMfEFOp/t7OKMqVQ=;
        b=reDm+x3bYaTSn8qGUNDwx4bLtSC0trkl/557T21TP8PDdMksi3S99ePxVN9NYn0ShD
         rSzj2a4a4Inmi18BtVe0yvYhg1ODsyIpT7k0+p3QigCBU1r1ipPowSXD3h5hto7ldoAG
         81ejljuY0g5d4xjxbQaBgFuGju9xW14y/jRotAoYJe1tIVzGlFuzsjfl4apkzQdzY9Eb
         Ikr0P5809/c/xkK0zKCBey6tMHT4lP1ag0WQkgDszso8yLByvQpp9x+AnxVQMlGTKQBn
         o1EFm7VhaJGGS2sb1tltpoIaO1EnBS08QVf8jtjLrjnxrCHhL8W0nRjJlr4CkBBKTKqH
         Ly4g==
X-Forwarded-Encrypted: i=1; AJvYcCWE3aDjk22SdTkadzz8rqiqJbazEUhnXlEtIpD//s15/Xo8MKelq9JgF08GwVzX/5thihX5qc1fWthE48o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk67liblfcnX8KG70ktKmn3G6jdNHdoXQw1jTvtyBo2vEy6dn5
	tmDYaS0WWq5rbO040GVK24p2MgyUQfnaUZNCWmAuhBW+AglPL5RfA+qFjjeLaDGvpspBrgrunGW
	c+8Nd+yIBiMCiPSqLJyNorpr+KjxptoVARSh08CLy2KTs8OFR8fP1haq2YfTvsa+RuJPNIccUfp
	slwrF14WNRrAvvw3eULMpPmLgaWeNS9xZPIr65RTH5Yg==
X-Gm-Gg: ASbGnctLYCW9c9uOJ7XGRzKmQ1ZPBUHd2KyzNGAArY0CfvdkZs+/WznJtvZQGTj3ZMJ
	p5vnsixlAA8/TN1V/HJCIxdTR184g4z1D/W/SOzDt+KRRXzF1dmCcEgNdNgxACaWoIykVJh0WVW
	srmcY7
X-Received: by 2002:a05:6902:2846:b0:e7c:3db3:9ae2 with SMTP id 3f1490d57ef6-e7fec8c20a0mr19439364276.17.1748913847070;
        Mon, 02 Jun 2025 18:24:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRNXmgUXa56X84DDPzBysWHhD8lC7DaZh0a8VFTs4nS/AwD2eUZ7nzp+zMA+ugyIU7MwMpkecY9Z7FF+IU+mM=
X-Received: by 2002:a05:6902:2846:b0:e7c:3db3:9ae2 with SMTP id
 3f1490d57ef6-e7fec8c20a0mr19439342276.17.1748913846769; Mon, 02 Jun 2025
 18:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201-topic-ignore_unused_warn-v1-1-f29db78cea3a@oss.qualcomm.com>
 <93b5004dacfe1151ca3abbb0fa31eaa6.sboyd@kernel.org> <87241686-90b5-44fe-b4e9-1a59451e3575@broadcom.com>
In-Reply-To: <87241686-90b5-44fe-b4e9-1a59451e3575@broadcom.com>
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 2 Jun 2025 20:23:55 -0500
X-Gm-Features: AX0GCFvMMl0IyBy3E3FCayY7kJ01cr0tAWgjWudVIiCu7u_i2rt18DwZOdpPk_8
Message-ID: <CADLxj5SfR90nYWaT19G0wGWM7zw7v91=LBHjZzb0z0+uERcXVQ@mail.gmail.com>
Subject: Re: [PATCH] clk: Warn (and therefore taint the kernel) on clk_ignore_unused
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAxMCBTYWx0ZWRfXz1PJic+wtfVn
 0IiUmS1masOtpk/bKRAuBi2ZyXzLe5gv0P842rhotfZmVHDYEEsmpFBt0weeVg687G5cWAXmhPp
 XcyHqYjLSU9TlWfpzWznj0/GRa2qY7HAzZ4b6jZOST3Q11AfY0qGa4ydTHAvYlcir99OvHZOSNa
 fY1wpXxAo6h1WT5kD5q5d0MV7U3ZFaECVJxs6lkeOS2RI0jAZ/Aew+lh4jz1/gKs4MbqyaxDNuw
 3elDEDXvCx8WQHn7fb9kq+wVp3w8L6Xc/OKS1CPoD/tzBkRvaqM9FJP5Ll6BD3BUCai4mYKm9AX
 9iy+aEklqxi3Nap1woHVP6A/8FyMnYyQyCx4jd3SWwyoUAEy9BLqsC5pdQe2xnRBddHMSxyBk8m
 pu1lqpYi99JHTMGlOH6tQrpr6r3bTSL/nR772a8Y+99Y59u2tUeEDmE+jEco0cWrIL/ddzws
X-Proofpoint-ORIG-GUID: mkJR9pBCSZ11W3caB7nY4ChRRJIIvoIl
X-Authority-Analysis: v=2.4 cv=OuxPyz/t c=1 sm=1 tr=0 ts=683e4eb7 cx=c_pps
 a=peiObFy/9J5zY6vzkL/ViA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=Q-fNiiVtAAAA:8 a=WirCTdtIKr2iH7wj36YA:9 a=QEXdDO2ut3YA:10
 a=uSskPZdq7w8du69dlLff:22
X-Proofpoint-GUID: mkJR9pBCSZ11W3caB7nY4ChRRJIIvoIl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030010

On Mon, Mar 3, 2025 at 5:16=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> Assuming you have a clock provided that can be used to turn clocks off,
> and you did not boot with 'clk_ignore_unused' set on the kernel command
> line, then you should discover pretty quickly which driver is not
> managing the clocks as it should no?

clk_ignore_unused affects the behavior of clk_disable_unused(), which
is called at late_initcall() so if either your clock provider or
consumer shows up after this point the disabling of unused clocks will
either not happen (because the clock doesn't yet exist) or it will act
on incomplete data (because the client isn't there to reference it
yet).

Regards,
Bjorn
