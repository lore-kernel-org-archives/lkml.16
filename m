Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800CF26FDA9
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529661; cv=none; b=RNqjtuAIRvDrWQgujJI4wgKzYpKcb8PjCjvrsB5tQZIjW+BhN5UpfXN7Q3g71wqCvRivLflSR8BIpWIDcGbqWkkq5vQBTJsrdyn89qrOJCN4Rv0C70GpGo34cqi7dH6Fab+MPql6MwzZVxr5yyJSZJ7ZnvObR+wVSoGmijZlz0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529661; c=relaxed/simple;
	bh=4CYOA9AagDnQlzLO8jvRE7LipR/5rn+iPGyR5z/1opc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pdAqNn/F4YjTVzTxJAiPoio/kMu84fEEyHbhAo6v9TmSpaZN+p/E4omkYIX1nGqKiVz5EbIOC47JfQaBjjBDwj9ZMncPSfA+KaAGI3ZO+DedURsUtTvkM6obWLc7IQTgeIjl0/w3BdzKfOiruYOBQ5iSQrRA4XRGf6dmEmyYia4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkWpKB4N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkWpKB4N"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L8ntQ6018874
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zowIyNUEyO7rt+gljYGoF/edvYqN+vq2B4rXcDP0lxM=; b=MkWpKB4NGOYwGE5i
	5Kqzq4iziOFtR228nkHelZnK4XWLVSZmphg/p54UqhzNH1wWU1DN+RG7qsNk5x0d
	3Szm84sTJVRRnvF15IYTGFYWf/NmoaB6pQ7C+njcOqMA2PfKVrCv4origrBKnHSa
	ONrSat6u7iGAcfGEYtU6wNYcySqI1/SlGQP0syWUk6s8qYW3C20W1la5Ve+xPqR1
	b3rFysi9R6xA+iF3osCtpN5UFccZDUxN56+9Vl6qAoZeD3DPH+YKpYaTGWlyKWMf
	ErhZlFG/0S6lW3U/j9VqYU79gLsJwGu7IY6neo4RWSdRuh/zmJHsuP+HBG5kM3lv
	UrX1ww==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dpqtrugm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so857491085a.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 11:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529658; x=1751134458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zowIyNUEyO7rt+gljYGoF/edvYqN+vq2B4rXcDP0lxM=;
        b=GtDVkp76jrEkTf+Njenq8yoUEgHuhxmAfup+701Vo+Zzeos12QmxEOj/vR757TvH2Y
         Nc0GdW1Ghbv4z/45Pt/eHc+mTD0Qh+P6bkQU2Yx7Yhex5+p8Dnxys+oe2Ca323A2BeiO
         jqkPm9JQ5StV9nUivDdC3HvlhsEPL9WVJ8O/bSKLplZifAuMiKLPdEWV+1FJ3lpGRrmb
         afZ064uhm5eFGYoBJsiB2D1LWmvsxKB+Qxo6p9uzfMZcVluGnhdiTYwaeweRZOI2jkwP
         DC4r3sgQUjoXkoyG6+vYUe3mfoiawA0yIQW1VoNSExbyuGVJZtrLjwzLKjnJJK7CV+J4
         ThsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWw9NJLgKHn6Ug/XjFeWtJdJ6Eac/4fibLn93WDe0cORXfQ8EqbDQ0Ap/SVy0yMMce0JGN+5ClfiZsskWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMmlMrdd2dXOT7Ho8swcr9xKGqbfgPksSHiDRoD9YpqlPXnjyi
	VwzG/FwS5Ji4B9kkXH+blIKv6XciJNoAJ9cbQq/sdHr3AZ4HGSrOij+GKc0cx42MN+C2AFje4bf
	JwkKVfYuYY90U+/zKW8HolZ/fxZsvvBluv718/jJ65/Ksy42JvPeQ9/DwV+O51ZYozf4yvtCBOT
	Ht6A==
X-Gm-Gg: ASbGncthkOsRWnt1GY7HqbxEeEoH2cYLxKdeelhER91Yfq6cbawNtxno6MiwTMp8zb6
	ARsfBodf+BBYJm2xe9/8cYObRmIyt4jSZ6CT7/qD/0sepHLD2g2Ir1sQZotoJRZ3X/lKtyEmGs1
	EgUHAEnzDDMGnKa6YhYdPQf0UB7Af7i0OjidPW7kR9EtnCKivfD3gNmmpSN4SPwfywwoFQf+IkH
	Cgp6n8wif4dBNOeE3PWvIUP8CHF7UIEz9MjyXEnEh++tiXIwK1zW5g6HJr4/yK2LRY5KMYzQ+A8
	+sN8RuPGpV9zT1qTsC2AOaArIAh4++qKs7K9DMUXZy1wP/EPPcClM6rOwjl5ZR5c2/h+ZX3dFPY
	GMnuVW36xIPl/c+fqk3ImsJ8hO/1h9nQhfSg=
X-Received: by 2002:a05:620a:1906:b0:7d0:a1d2:436 with SMTP id af79cd13be357-7d3f9932ab0mr942601685a.33.1750529658157;
        Sat, 21 Jun 2025 11:14:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1/0MhQYuKfBpzeVErFNYZh8FZs6s89lsKMD66pGJWLmGvzYlwhn1nDZIEbwBmB1PBHWKAUw==
X-Received: by 2002:a05:620a:1906:b0:7d0:a1d2:436 with SMTP id af79cd13be357-7d3f9932ab0mr942598985a.33.1750529657781;
        Sat, 21 Jun 2025 11:14:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:12:58 +0300
Subject: [PATCH 3/8] usb: typec: ucsi: yoga-c630: remove duplicate AltModes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-3-a86de5e11361@oss.qualcomm.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
In-Reply-To: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2145;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4CYOA9AagDnQlzLO8jvRE7LipR/5rn+iPGyR5z/1opc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZzEwCSquoV5Q2Y0LnJ2z5hijlfP4HmCo0CY
 WaWygQHwP6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cwAKCRCLPIo+Aiko
 1UWdB/9erkAZ/EL2NpUqbd0w3OylzoPIom7LGhqMTEJFDyP2tBqOczET09Z+xyhim9bUXRRvoM2
 VSaa23CqxqeoilfJMB67B/BTP06kqCv07Mum81lER5PQoqeLh5MiKfKLjhupdFeHxUt/umpkmoR
 nwMW0W3NtoedisLaIv+r68ZLWHMQhU/nxOW72rMU/5QshyNtZ92+VbaMffjE+uo8miBDynSaAEu
 btb1zSAgosSHqaOu0+9Hd9WJ4V5Ep0/bHZQVowFqjGI/8zoBpV9UMBaodNJ86Lc1SOLBNlHNux3
 M7VZpB0tHP4flQMmrqaFNMgWuzozAfvPzzx8CArzMlLyZNbB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNCBTYWx0ZWRfX+uJFamQH8HD3
 eHBP9++IcB1UWIwZIYuXmxpgAyQolBAMGM/ES81a0ewFu6BqmMqjNGyYuHYY4NrM8w3zu77J/ab
 oSS//kvH7ScCoQ6umoB1kr0eX07ACFCcDAx32hdIN6fL0kkOUKUXHlBftT4tsTnh6y0YknJEOXB
 mqUZL9D5OcJaRu0pZ05x/NJEbfrT6V60daNtpMUMdfkJudPwkTmBhFoU3slzhYiXVVr3uOcoz/Q
 2WVersU4Ec9WvXvMeMQlNHQNBvNOIvWuLeXRXvgd5t09tegDi7GIxk0wKMyGw68Qv8J1p2YpKDl
 MgRCei6HVnSZioniPmYsNJwxZUsX00Cl3LwCm9+ymDBYaq3PHsnv1vk2+DXGpWG+UBJAPmHc3Bp
 qH92PuKI4fwpfUVEcTfUFYBkacwy/e/JcmfDjJ6Dis1xDZ2CC8WK9zyxnP+g9EY3zSe5s2GU
X-Proofpoint-ORIG-GUID: P5od1HMrYj4-6Ez68k8vEyni4lGzRPMx
X-Authority-Analysis: v=2.4 cv=cbPSrmDM c=1 sm=1 tr=0 ts=6856f67b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=AZjPiHVZ31VRnYr7GT0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: P5od1HMrYj4-6Ez68k8vEyni4lGzRPMx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210114

On Lenovo Yoga C630 the EC firmware is buggy and it returns duplicate
AltModes over and over again instead of returning an empty one, as
demanded by the spec. Ignore extra altmodes by zeroing them in the
update_altmodes() callback. It is not possible to shortcut that in the
sync_control() callback since we need to know if the AltMode matches the
first reported AltMode or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 47e8dd5b255b2b306dd9c3d6ac8c3b896954981a..7cc1342d6e2f1d2c6f5b95caa48a711a280b91d3 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -71,6 +71,28 @@ static int yoga_c630_ucsi_async_control(struct ucsi *ucsi, u64 command)
 	return yoga_c630_ec_ucsi_write(uec->ec, (u8*)&command);
 }
 
+static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,
+					   u8 recipient,
+					   struct ucsi_altmode *orig,
+					   struct ucsi_altmode *updated)
+{
+	int i;
+
+	if (orig[0].svid == 0 || recipient != UCSI_RECIPIENT_SOP)
+		return false;
+
+	/* EC is nice and repeats altmodes again and again. Ignore copies. */
+	for (i = 1; i < UCSI_MAX_ALTMODES; i++) {
+		if (orig[i].svid == orig[0].svid) {
+			dev_dbg(ucsi->dev, "Found duplicate altmodes, starting from %d\n", i);
+			memset(&orig[i], 0, (UCSI_MAX_ALTMODES - i) * sizeof(*orig));
+			break;
+		}
+	}
+
+	return false;
+}
+
 static const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.read_version = yoga_c630_ucsi_read_version,
 	.read_cci = yoga_c630_ucsi_read_cci,
@@ -78,6 +100,7 @@ static const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.read_message_in = yoga_c630_ucsi_read_message_in,
 	.sync_control = ucsi_sync_control_common,
 	.async_control = yoga_c630_ucsi_async_control,
+	.update_altmodes = yoga_c630_ucsi_update_altmodes,
 };
 
 static int yoga_c630_ucsi_notify(struct notifier_block *nb,

-- 
2.39.5

