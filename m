Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED04194A6C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823469; cv=none; b=VePDKYsKg6eM/g+N8KJgt9Jc9BUp/PBnNi7sxoI9C85+J/qGh97bdx30LgBgvTCg9CqqW38bXevRbF6NPk5EUQTbowne8u1XtBR3fuKKVqs9Gii872bNqrCM+kO+IvtpmA7x1r3HiX29nYV8bLjCxLvCHRXbJ0Qtxiah6m+POOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823469; c=relaxed/simple;
	bh=s1I0hO2fQeu3Lx8bcn22vAaZJi9/VyHMaDvC/IBF9lk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=JTvsxh1GUxOwoHcnm0MsEU+2BByjU3Pk22KYn50ORYCFY/I67hZcdHEh+z/fphdnqKpHHtRH7vQ3ErPi5/sYmc8kENZQuKPOQCjJcm+xdsSC797Eom4o4yv9EiTDa7/HWNJq+f/XxVI9Sl9j5u2YJjOXJj0V+AhCeipOeTNKNzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GL+5lOzZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GL+5lOzZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55DAQk1q000673
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c1wFDCTO6wUZuBHp8bagLi
	9pdo0bLajjZYPTJpMnvVc=; b=GL+5lOzZx29t+NI0x97M9y6xoeMsyuxDWoDRi7
	upcl9NPGwDOZg29FT23fG/qCaoEWyCVe1tn3XIThQcNznu9cjNdf5NKhUGWJZl3K
	5bU/PbMuRUjUV43rOQcMkBlU+iQUMYxWPtMts8XDnIRITu0h3JuZdM8e6tzfd5Mz
	1mBC8FXnKkX7wWX0RBQcXJlEUF+upq3N6hLpry1kCyplZi4M0ixMx0cIvi4LaR4I
	zuCQrTY+4oeEgXkWICV4tjSOkhl8mv57TaytsncHLsKlCi1+C05IneuR4IEN4Qxp
	9BiQouzi3reBmpaR3Zk1TvWDSbMZ0HH13nDTXe3fdrNGUNbQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477jdww6dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:04:26 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-735abe7be85so1477182a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823466; x=1750428266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1wFDCTO6wUZuBHp8bagLi9pdo0bLajjZYPTJpMnvVc=;
        b=BNEB7NwASj8TCfWpQiuXu4ty2wskqHo6ctD0Pyj9l/32OB5f1VqvwaaMyG6Aiu3WvP
         PcPPkFJxUl7KBjR/IXckbQMQUcmp6y8PBGgykeCMcL9cgrIkpo3CS/K2lhEHQWcS7uB1
         vwLuKV0ib5mwoIQY7vmjlBJk/dWwOOxU89vPHmBc/2+ld22uJZn8Un5kO1vJUVR3wGl6
         4IxfStlO56qPmtl9MD7qKlE3jG9BOadRm2nok3WR8s3+tfFrfDT3pJdOyhac4BfaLZo1
         nlCGJsBriW7CXgAzZ5hWqmbGRTfS/4kcEKMCdrTbakjJx0274lmCqbmrDuLlzZRrB6hK
         fNmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUybduYi/svLnOmihVFu0dJbnXJgS5Y8ZRKylsP0Nn7Xl0X2B1nQ1d26fveyou2HuyusRgJapFbMW7Ri8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmGXgnhsymmR/nrKG5j5CrGku5QZ+Qz/RHoOV3oo8h5SakaPrg
	5w+RloWz9JfeVj/0K0AUdY+lA/ydwbluVgaSEB0lMSxRgG9vt5bE6pklY5RsBi3sz6WTaT+3IS1
	Y2JQgWcQf8Fovi70UsR03u0WY2kB41IZ7pt2sf8Vsy+GDScQ/MilELe5XNqnz1jmOaVI=
X-Gm-Gg: ASbGncvbO6TmGGHRhdvAF5m0JnEen5qNGFzFezy5u/E/osyl+w/cInebEI2LsXppji3
	uJGPf2G8NM4RFFR6M1UpY8dvQfll31Dy09QUT1mXtIlNhIKb0EgxeKOenyewx4+LZHtTQl0o0E2
	v4Eez+3PAzq9jtCM3V/ZLCe6IJnk6btolSdWA8FfPbTDYh3nafHGrQ56yu1LPtb5j9ejIskagV1
	DEoMrZy31R2Ll4lHWVrSMkrleBDK0r0c/INz61vHx+Yqu/UUU4OHjwl+/69amTUcGBWe46p6Y8T
	JFMHYkdT2jz2lxs5vthB18KMzBLIgjcnq8FH0rvj25yqFFJiXoOhG6W67EaPQKw31X5X4qnbt/z
	Z
X-Received: by 2002:a05:6830:487c:b0:734:f8d1:6ab3 with SMTP id 46e09a7af769-73a331f2609mr462869a34.0.1749823465557;
        Fri, 13 Jun 2025 07:04:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHozzL2LNTR1LHU1fFwn8t/C97PjFxz4nDTKzvcOASqJNquAMm92SrwDHW3UYP8OhqMsL6aIQ==
X-Received: by 2002:a05:6830:487c:b0:734:f8d1:6ab3 with SMTP id 46e09a7af769-73a331f2609mr462772a34.0.1749823464346;
        Fri, 13 Jun 2025 07:04:24 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e268de2sm53503615e9.40.2025.06.13.07.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 07:04:23 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, stanimir.varbanov@linaro.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] media: venus: Add QCM2290 support with AR50_LITE core
Date: Fri, 13 Jun 2025 16:03:57 +0200
Message-Id: <20250613140402.3619465-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfX7rNLq1imAan6
 ghpAwlS0llkYssZnrUtxYfaVMCu2gECCfiQyEmssAtz4w9YNnjDlrAIbRlsVxnRHS7qou+Ajx9x
 YrfZgUPhczOCwBJ9sYHrQqAE7TCm9V3cQsYcP+9AMUot2vlu20MzZFGmCRTg+dAXQMNMrqSJK32
 szwzmE+DLbdLlsPSm0Pj0bW78JYFOhvyfkjOZ7+CxF/gt582AnsCo6uP+mOl03mJAIIX3r0OJvk
 2GJwnWzilcXTT8beFXOjEqpG9RjxcuwCLUkuHJLIRQhf/xqPplc32/c/4lwrR1RR40UU8wM6YBC
 7HK4kpqxWZGX3MCnq5d9KT0zrQp1uhbBbzLDYVEIdyyRYFK07fbtx1XqNYS/+1/oYjLHxdqJlRq
 Id8IJYIWsWoc8BZZyzTgFYlVuPPI4pbUHR6z5F4rICHbpYZH6HETcwMegTQ22GdyzCN8NWEy
X-Proofpoint-ORIG-GUID: -EfgO6Qoi_OkakpR-w7DM1sNFWH9hh1-
X-Proofpoint-GUID: -EfgO6Qoi_OkakpR-w7DM1sNFWH9hh1-
X-Authority-Analysis: v=2.4 cv=Jce8rVKV c=1 sm=1 tr=0 ts=684c2fea cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=vaIsIKZIAAAA:8 a=8Ml_vZegNoZ2K-C0vxsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
 a=rh-XPM1-DYv4t-UOgbwD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130103


This patch series adds support for the Venus video decoder/encoder block
present on the Qualcomm QCM2290.

The QCM2290 integrates an AR50_LITE core, a low-power implementation of
Venus supporting H.264, HEVC (H.265), and VP9 decoding.

The series includes:
  • DT binding schema for qcom,qcm2290-venus
  • SoC integration via qcm2290.dtsi
  • Resource table definitions and frequency scaling
  • Platform capability registration for the AR50_LITE core

Decoding was verified on the QCOM RB1 platform using GStreamer with V4L2-based
decode plugins. The following pipelines were used for playback 1280x720 and
1920x1080 H.264, HVEC and VP9 videos from https://www.elecard.com/videos.

[H.264]
gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
  ! qtdemux name=demux demux.video_0 ! queue ! h264parse ! v4l2h264dec \
  ! videoconvert ! autovideosink

[H.265]
gst-launch-1.0 filesrc location=videos/xxxxx.mp4 \
  ! qtdemux name=demux demux.video_0 ! queue ! h265parse ! v4l2h265dec \
  ! videoconvert ! autovideosink

[VP9]
gst-launch-1.0 filesrc location=videos/xxxxx.webm \
  ! matroskademus ! queue ! v4l2vp8dec \
  ! videoconvert ! autovideosink


---

Jorge Ramirez-Ortiz (5):
  dt-bindings: media: venus: Add qcm2290 dt schema
  arm64: dts: qcom: qcm2290: Add venus video node
  media: venus: vdec: AR50_LITE video core support
  media: venus: hfi_plat_v6_lite: Populate decode capabilities
  media: venus: core: Add qcm2290 DT compatible and resource data

---
