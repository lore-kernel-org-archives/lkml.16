Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7824821FF4E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334631; cv=none; b=NUWWaazq4dtoZINFTQIMbvUNMD8Ejel+RiOPJAQeqXE3/GZ/tByAfHdUoqlQQ7J3biFJBAp+NNxvn2nGshQ5UhqMrr4Bcfv84z3HdommFLUVebNdx3JFQxXdhSftLwfLiiZuLmu5Snz/m5SX9V2iYKouTmcSNDCO/1dtUFNdI1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334631; c=relaxed/simple;
	bh=BYv1wKzoEogSiFAnybZR9Kuco3a8+54+9dV70GXXuV8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iXxEpCQQMw2R88nEOBAbf7AtE4grJJIq84BNyAjTFQ05Rc6zoAiTVRkYa7q3cJ77hthGKx34BwoeAe6o30Oey8mKK5mf7EpQhGlhzBLlNzKec+px97QFN6eC0nCXRdLsN+Mffj8na9U7AkLtmoi791skVCGC4CMvfTIEkFw7QXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oKYlR/i3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oKYlR/i3"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J6fcp5026180
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5nn72h/qaf4NeAzriwbTHooNzuUElEUmweZ
	aL3/DEzs=; b=oKYlR/i3W5WhSERMx040GTIyHrcKJiIpOXI2fhxUvVBrvvcuP3O
	0qGVI32ia2XWmlAfvXkEkV3KG7jUT7meC0Eo/jsC7N9uW+hEupA6EqONx43PDDTB
	QTNZNUOGpgu/iotcyYZG2587HqCtUUu+LbYMKe1Fa7rT8IX4iXRiAJGCWCm2XTmf
	5TJjnmJz8psoEE250vpieSv9tso1AqhL/3UTGz+Ibfh+EyEmXbcd2Znig5+L9q3f
	0DAjaxI5wL6lEEkDjaeCgS0V04fxwVElZeWCJO06Bv1NdCSc1PY3dFIKEKckR3/a
	do9Sgzz3XOs3YA7gcvwUKvD6O07KwV5+58Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791f7ftuq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:03:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748e1e474f8so1079691b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750334627; x=1750939427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nn72h/qaf4NeAzriwbTHooNzuUElEUmweZaL3/DEzs=;
        b=MoxS3dZXpzTCOC5b5vJiELoV46lInNIEgBnmNPVxTa7d4zwbG0YLDyYe1/ms+UPp7e
         bcj8QRuhAKaWeVH7RgcxdjyvL/bPCa/vMXMDTWb5UOcYTDpeVUdByGqk4GTM8qo/8LgR
         uDXsqnp8xvNwm+c4j4AmaA9pE4C63yNlxelfxSHvr2/gTfNwywR0OW0klMfq/IzmvGlu
         e5UV8u0gsHsGzY/wp8nDPdwXGCB8gvULh+fve97C+ySWTRVAw/tplAkHJwsNbgiFqrzz
         K9R1v3iJ8t0sJ6cQKhxi7yxLgNOnG2AYakHygMlF0LWDYMRbJJ2P6Cje40qxBPdZbV9O
         8CFw==
X-Forwarded-Encrypted: i=1; AJvYcCWnamCTWwppteue+6H/pfu779Jjk/K0tGuKdaJ+eQJGzl1gv/mVmQG0LOhFiOLPBCEGfS0IYFzaRSzYhpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpsS4MQecNt1ukXdq3tNggH7YlF8koZwqc5aTUgpq++y5Bglz4
	mHqW8U9c7aB86UQ0OMmktsWqRDA0pH1YUozvbCJRiq/3PW1Xt91+iA2gSn04dinVa1fmykfy8X4
	NldWp3ACEH/eIp0FdRFnqksvt/Wp2jjW8oSbRIcnEyJVMccCOjgcxgewpsgA6/Ke/dcA=
X-Gm-Gg: ASbGncsSRFMAcj586zhg71vqKcmVaJt2O3BYw8AXasfrNH9wIoeyvtrSmZ9wVawJS4T
	0DjUxQGcxWoGHWZWY/3+obX4v6am5UKol+jmI/pjunrKCH8+khA2CiB5Nh9gLoJSPU4CgTJi+NR
	OvFrgYyXLbRCt3aRl2n2tM2lYa6rgU4cqbJk5sDm9aNr1WiBGFoHb7bI2i3R73mXBSDy6tQbL9I
	CPzbnO+gxuy55CyEfbzoz5qHdPKxOeGa7o4LroAreClYYKhrF55rvRZ1jz4AaYBlGUJLG+2i+fq
	YV/AUSMQtJ1gzYK3yFvPugSy2zwm7kwuxKmMpwAxSeAnYWnDi5Y=
X-Received: by 2002:a05:6a00:4b4a:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-7489cfc2784mr27835389b3a.2.1750334626449;
        Thu, 19 Jun 2025 05:03:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhH0iV1FehZN/HsECMB0SAFpUyNm20MWg0wM1POjItQCw6FXfAX2uMuWWmq9njzsMHDO4LkA==
X-Received: by 2002:a05:6a00:4b4a:b0:736:5c8e:baaa with SMTP id d2e1a72fcca58-7489cfc2784mr27835345b3a.2.1750334625933;
        Thu, 19 Jun 2025 05:03:45 -0700 (PDT)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d2554sm13500312b3a.170.2025.06.19.05.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:03:45 -0700 (PDT)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Subject: [PATCH] usb: dwc3: gadget: Remove duplicate check while setting xfer resource
Date: Thu, 19 Jun 2025 17:33:39 +0530
Message-Id: <20250619120339.847708-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEwMCBTYWx0ZWRfX5OZ+fIZzJR/0
 aIB+BMDihbnEzNG89iMh8os53B4zpznLczOYaq9VcHz7EbQn5ZzhxCPogojw30X9hXISnD3W1w3
 ix+dg5MfK/puUB0C+w3byh8WZp/i/SWNl0U6SK9MVxXfLcBkVDG6fGn9nppI2JxaIUfT6f15GOi
 /385MSCmLpohQaEDOev6yt+CyYED4aszipAxGCdcAXkUMcbbByxZXACEpWjrPgCKBmnQ0yGeNTq
 UpQVXihYcbbEpiyUyQZOA5XR0QnOuMwiOIHxqI8Yw+Rn+ecagT7gwiVOtMcc3y1fuaWHVngDfq+
 6ajf/VIzc0D0VH4BtmnFthqqf9KwFyesbs+NKjuD9fmo9MVlMmfqoz7XbdJjeR0UicwbySmKsUV
 ic86VPVXb4kmsmNeAW1MyjPQ0MaTI8BglnZXk/BuGu43/oqYR/jvPwxaOrRSihYZbAKpEDp5
X-Proofpoint-GUID: 6RwicSEXrWhyIBzaKhVqP2BI0vMXRKS0
X-Proofpoint-ORIG-GUID: 6RwicSEXrWhyIBzaKhVqP2BI0vMXRKS0
X-Authority-Analysis: v=2.4 cv=FrIF/3rq c=1 sm=1 tr=0 ts=6853fca3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=Ue6Mik-S3He3DxBvPj4A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_04,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=849 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190100

Remove the duplicate check for DWC3_EP_RESOURCE_ALLOCATED flag,
as its already checked inside dwc3_gadget_set_xfer_resource()

Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
---
 drivers/usb/dwc3/gadget.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 321361288935..e45f7cb17d72 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -924,11 +924,9 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep, unsigned int action)
 	if (ret)
 		return ret;
 
-	if (!(dep->flags & DWC3_EP_RESOURCE_ALLOCATED)) {
-		ret = dwc3_gadget_set_xfer_resource(dep);
-		if (ret)
-			return ret;
-	}
+	ret = dwc3_gadget_set_xfer_resource(dep);
+	if (ret)
+		return ret;
 
 	if (!(dep->flags & DWC3_EP_ENABLED)) {
 		struct dwc3_trb	*trb_st_hw;
-- 
2.25.1

