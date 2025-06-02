Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FB21AD403
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 07:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748849043; cv=none; b=rAPVO17agWGVeZ+UhDCVjBO1IBfiBtkcgVKrWKRmR1NPqJ7hy/yh82cgu8z/Tm3RJw5UJkze3BNnwKhFclRbpfMCuqG5yFfDYTx6cZlMVolz5lz7b/Cz+Od4p4QtXEFL9MI7g8ZjW8mpO8K5YQOSDOrEW9o+RLIi7eR5GnNT0S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748849043; c=relaxed/simple;
	bh=CBMo3phr83jgUMZt0jAUHfVtoIwsR8eJ386zFfEoaeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mCKZNmv5B3h9ZLmGq0lYZ3BGtI4PyyUuwFIPkbOmCqN2nAUlf+fHkcRO5JiS/9JtbInrsFC4qBvqWxaopsIbRlx9v2PQrQDfIjl/NHKHd5T1ISm7vgIoSmW2W6F9BGr3GabCnE5WPzk+utca8VkKqRD5WqIqU7b1Zq1vBb38QBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=liVC8gij; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="liVC8gij"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5523rDBq011073
	for <linux-kernel@vger.kernel.org>; Mon, 2 Jun 2025 07:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s5eocu6KdfbwskievOHz6Y
	oQu6IRRUX5nAFu7iMHziU=; b=liVC8gijDD+weKUsy6yL44vlqnj2ih1Ghgc23u
	ghpzFY1WjyltGL9FaJJLrNeecsIxXFa4/OYpgkOMoCScGsP0sPsa9Ro0/PkVflB3
	BnuPqF88t1qeHztTvkYcT81YIKiau76tXpJ3En6CRjG/BQr3/UHIMv9DGqgPs6Pz
	dUw/7Ifbuz4/0jXnn/xo/n1eCob7etq6qFMcnmC48VZTbT20ct3JBUTxRScMjlc3
	Xc2eYTPQlKzkxIBvXX1zB3LVjbw1nSASTEY5mymX7+LNOjydQVGDXTLMEmFfPELe
	rZz7C+CbrjqwC8OHNK8+5Og3QEQ8iG2JKPJpEoZ08MVOReCA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytkwbpd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 07:24:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a584d066a2so17275601cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 00:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748849039; x=1749453839;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5eocu6KdfbwskievOHz6YoQu6IRRUX5nAFu7iMHziU=;
        b=VEl8SN9sFFZvD3BVjkAk34o54gFOcAxwKguLcdGcRNYn+IaXOqwuBof3HkC48z2w/D
         kFFOBVNoWGbopgcyX0MvBIaspLOE4v03Ca0k7oe771lJS2bvwiTRXwgsAQRd40myViAG
         JuLc4ANqyHrwrFHi3bR4mL+RiYSZIurOk57bwXFi9YGIFdrIC0Jy3mjazkAqus1WAhhe
         IqFc0y8CETDaDjP87kBXou2yYNFCWvU7ZYMZwWXtxjzpAbSfayUlciyFoRM2YcH6BPI/
         36bFHVGDlu6OHZSyZ7OY3WxmBtF1Gs6+nCfoLfkHCWpz6fm5a+MgOSeudH8PY71T041L
         dy4g==
X-Forwarded-Encrypted: i=1; AJvYcCVRY3KSNaAIKONHPqUXv72ra7k9/hyF3m9U9iNKrwTcpvGVpKXW8aws2qK2S6Nf+PAv0nn05hh0lg3pT2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDYcpLNoDkyyYS6KGtGEzVT86FsOlQ9jEld/r6X5chr6/WMf5y
	nbDYnP5YBydzpIvhosIib2suJSYHYB6D9WQbrfO27CQax8W2Xd5kPe17/u4EP/HyoX40UoB59bc
	myzahOhTQ+RSrHv/5CRmNrxw5TxQJBJ2wbbmJ3D5kaxiw4SpxeMedjVYnM++qOVu4LHFOb+X8HW
	0Ajw==
X-Gm-Gg: ASbGncsfY5htUJpiAnDLl7WZejBS0uzgek8Gnv6F1f7QkoShHgdITA4Bwj1lcSk4pwx
	DQ1jY09x9UNUXCnKO7Gr8UykqIENhQHwCI5j9lsCVYSoKS+IPBBkhWc5yIpB+qz9tqnfzIziU2i
	ZmNYgmdLAsFBO3TKDt5dw7XOLQbruF0fU0dRzb5RbYnuTQjv/k330BTpx8CIYnjizYK21hyBwiG
	Lb4v67ulbOVSW0Qpqzp63Zvx7moIWpqPZCXYUckLryPngK51HGA3iC4dBM2AAewrjeiCDjnCG1F
	683a+oUbvrlM0CKIVy15Uaxo9TZyS7mwAb0tmEVot2w4Tb+s84yP9hiZEDfHg01VvVBAUfKy/zc
	87vnh3L7r612SIMLWbk3pIYjS
X-Received: by 2002:a05:622a:590a:b0:478:f4bd:8b8e with SMTP id d75a77b69052e-4a443f49ab5mr221625691cf.39.1748849028231;
        Mon, 02 Jun 2025 00:23:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9X0R68E0LR8x13//Ryjo6YwI+eu+JAVFDVLT6gzXGpkgI0ipcxWqMxe6MCHG0NjqSq+7vDQ==
X-Received: by 2002:a05:620a:248a:b0:7ce:ca97:a6bf with SMTP id af79cd13be357-7d0a4e5263emr1714898485a.41.1748849017202;
        Mon, 02 Jun 2025 00:23:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d46asm1506607e87.47.2025.06.02.00.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 00:23:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 02 Jun 2025 10:23:35 +0300
Subject: [PATCH] arm64: dts: qcom: sa8775p: rename bus clock to follow the
 bindings
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-sa8775p-fix-dts-v1-1-f9f6271b33a3@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHZRPWgC/x2MSQqAMAwAv1JyNlDrUvEr4qFL1FyqNCKC+HeLx
 2GYeUAoMwmM6oFMFwvvqUBdKQibSyshx8JgtOl0rw2KG6ztDlz4xngKGvKtrpvQRk9QqiNTUf9
 xmt/3AwvQCXlhAAAA
X-Change-ID: 20250602-sa8775p-fix-dts-2eb4013c4dbe
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Mahadevan <quic_mahap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CBMo3phr83jgUMZt0jAUHfVtoIwsR8eJ386zFfEoaeg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoPVF3Zrk5u/MQx2/FPnPzUHbdt1p8IZaKdfCdb
 xyyyycFzfuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaD1RdwAKCRCLPIo+Aiko
 1RpfB/0UBjBA/fQWxqPvppkAmBJKv/kPwZHnMh6h/dBCmuR7HOh2GsmOADgnBcXfZjaRB3tzuq+
 coL33ywP1DyN+goQaDsmCAslSrCZ4nsBZvh3mDycFDj5i/xCFaKbrDIUcIP6AuzSMr94pISio6D
 6ASKwWgZcfXzNmdyBzypxAtgR2q70Q7M7Vwk/7hB5dwbAHG7u62tBNlRUVR9u5iz+kt432+kXtx
 F3dyx0L9/H/cgjzrUmZfFpPpCmpqhfw1/n/yHpxC5bnyI+tuBTBc5dnDQjwTMx68EN3E3KQ3SQQ
 7Y4Ls+YyKifLd5gOLMyHwZq0luiRbMsTKQYsYTlrHKKCrMq7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=JIE7s9Kb c=1 sm=1 tr=0 ts=683d5190 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=1MI5CES3H8l_R7eW8KIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 3am66oQvZEFgiDHtoDoobJoAXZ-Od5qr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDA2MyBTYWx0ZWRfX2/0ANTIBf7xt
 EQLOw+RtffDiUzvGVxK+HS12hzhwBWyuhACEVApyFrs3toalCW4iYcmbIVZBkJJlbuBrcD44nAq
 pxTELM8COAbJpxBXMGHZriVnzXZfUZqCal0Kq38/YFSyz3CrJzrHq7ivlPx8FdyOn3i8suHwi65
 zRvhQeSb0GSwowR5lFBvi2E4mAcmpsIsIJoZsIWfOKvK2shNoL88woVU6nfMNn05bh76XasR5Hb
 KY9xeJB+9rV4bGD3TQU5Euw4v/Ogx0UWzqj8ph5uF4T63rTcjGRdDwh4afghtxOgxcHG8W98F1O
 BH8u3zH+uzaPnNWTSTQUQYgGH1BtaPJSZovOb2QBwNyfzHakNwFKNoJsilZqvi4PIc6oSzoFxMf
 gGFwQjgmVk/GQYZYgKv/fURNtI/yOcNCNV0H/RuptAEhsNP/Zu2ckIZhNjzR7xD8izUQ8h1R
X-Proofpoint-ORIG-GUID: 3am66oQvZEFgiDHtoDoobJoAXZ-Od5qr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_03,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=900 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2506020063

DT bindings for the DPU SA8775P declare the first clock to be "nrt_bus",
not just "bus". Fix the DT file accordingly.

Fixes: 2f39d2d46c73 ("arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 45f536633f6449e6ce6bb0109b5446968921f684..7eac6919b2992a3512df1e042af22d0cbad04853 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -4122,7 +4122,7 @@ mdss0_mdp: display-controller@ae01000 {
 					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
 					 <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>,
 					 <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
-				clock-names = "bus",
+				clock-names = "nrt_bus",
 					      "iface",
 					      "lut",
 					      "core",

---
base-commit: 460178e842c7a1e48a06df684c66eb5fd630bcf7
change-id: 20250602-sa8775p-fix-dts-2eb4013c4dbe

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

