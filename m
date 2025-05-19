Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0068A275852
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747647807; cv=none; b=kn/YkokecbwS5LrmUymV33s0qAMtXgirRr4PWWrrGPAG/Lkgtvx4IKKLkMHsPaxkRnhvhLSkiYM9xrRhEzWqcxVMbW6eoH44XbLf9I9OhDU+YujTJrakOfn2eVUPh3Z5JWuz3FZoxBU+4gj0zuddUXlQuwVKX2//76hSrxwAKjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747647807; c=relaxed/simple;
	bh=xsy7qnLw8evkZCbeD6p1+RvCRcE2R11sd9iRKK+i99A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U+XPAU1Mo8wuIxQOM86BX4iZz6yk/weMH8sP9EFNDMTH6OKlcXj9E9u59HfqbhXGHfoAU5gmddegLM0T7XxE8ZqgzHKEdFhC3TDV9oHLKGkiF6Z55axmoTFfpgxasWJDusKvFY29N34W9sR62q9LfQjP1LHF03t5vTQmaU8tHZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RS+YL75N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RS+YL75N"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7GbnR023174
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ms4AsHGtqF6++l3IqWfdW5IwKyh+gOLE1wk2h0gxx4A=; b=RS+YL75NsAXYwD4h
	vOPSfO9/6++DZ3QSQOHFI3BvzmyhvOLwftO0SdfpaojVaKKwo+DLzSzf5UAMdrTC
	dVp/5+XMAzkHxzkAIj1asWiL4ieyPHUAmeGaIZeDfdiuNd5CpGhqAF59dl1CJj+z
	3azDRP8Pb6ASd0YVDXk6hRUn5qE4j0ZPh/WvSx3yXiaX569rqAPVzC8FOsEhIK2G
	7kr1WNkoE57X30ufXmItEnIG0xJcM1YbN1b2Xmfz/UVoGab5Khn8c+Q3NHNe8uIL
	DBI+TErcBCECOPK+P5C0pY9oXss+JRRw4c0mPVh1/3mx7xe+sNtVOURX8Q7WwyDg
	d5n+NA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041rdt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:43:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b090c7c2c6aso2742442a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747647804; x=1748252604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ms4AsHGtqF6++l3IqWfdW5IwKyh+gOLE1wk2h0gxx4A=;
        b=NX71Ac9c4oWOLIB3cq+tjpv2nstESjfhFKHNCykZI+ig/QHYjr62T95qYZ4JbPvwpm
         ZtTwaxHGlsrj1ghCPqY2mj34j/oZbsCyA7VjjcF+SMEBsIU+kxybIgy/QWVdjseoQ4k3
         CwOit6ByrB6+9AhK4MfhSYgqoEAvc5mz9Q+hjrgP5CPb8WvxC+wwEhYklwuUISR9yP/K
         63qgCpv5/OQXPZmOdo247J6s5FU9nI6rnKZoB6L5P3+ur8MXzQ0h9S87oJDEmP1qCH1t
         bDA0rYG/1D/1ZVb7oG5C2hSz3iibIGXCdHAkU+sdML9iQ2onb6dqhysKgzt3CZah2hFr
         BdDA==
X-Forwarded-Encrypted: i=1; AJvYcCWT/ev+E4xccZ0ORSLTiBu0m//VVz3rUsk+KFMEDcLXwtr+Mx4YoazcuwQUed8UmADUs7y8FoAMIS/fU+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS6WneYJWz27BZjzrjq23NxRzageTDwMdCUy9ZCU+jjF/oSQQZ
	r/nQEhJ2oM/MNE7yYoyJK3VoygvZxJwfN3j0MFL+gP3SStKjnGa84NURgT3/Q0H9d6z81054n6E
	N/HOrcm4mOYQGNpihePNWWpfOVuyLdX/sCgWfl9LdDz98Xrxg9ZENorce6bts9/Lds/0=
X-Gm-Gg: ASbGncvWUG9wgdgiPv5tYoDmUAyN9lOUSqKZZPVHQiXL6ksWvBpiMVT/eYKeA6pI0/v
	nHYnYuRUZA7va5k3MCeubP+kt87wGhXL0zvTdGQEni3TBtckevMiZAvJK6mi9tPcXnmWpYZq9tn
	3xwu5uCXP1+JuQJX2iuIxUtUsvcxmigrircbdl87SuaRV6uJnrN7eVrsdfD4Q2XWO4FZRIzedzx
	L6ls14uHpauOV8xu3qdcV4L//TRi1RGERNyqFK035SUhAuZme770n53iOTcI4PTDvbikM7W7CwV
	o4HnSBcja0u8DZVKUgUB0jFVX1wTk82ieJvaKhsOe4VYX6Q=
X-Received: by 2002:a05:6a20:c681:b0:1f1:b69:9bdd with SMTP id adf61e73a8af0-2170ce8c064mr18624939637.37.1747647804347;
        Mon, 19 May 2025 02:43:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI8bB3sFr0+tAayp3kXPL7kM6eemjerF+In7kpKG9A5RQSxk/YcDRJJ2IJ/dU+O5cjxvqLww==
X-Received: by 2002:a05:6a20:c681:b0:1f1:b69:9bdd with SMTP id adf61e73a8af0-2170ce8c064mr18624902637.37.1747647803999;
        Mon, 19 May 2025 02:43:23 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a97398f8sm5809092b3a.78.2025.05.19.02.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:43:23 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:12:22 +0530
Subject: [PATCH v3 09/11] PCI: Export pci_set_target_speed()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-mhi_bw_up-v3-9-3acd4a17bbb5@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
In-Reply-To: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747647743; l=732;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=xsy7qnLw8evkZCbeD6p1+RvCRcE2R11sd9iRKK+i99A=;
 b=RV/zKoNt4pz2Mou112fotyg8c0PTbzunkvtBsWXq2bk893o8qU7lN8dMiEzhxdflw+gCEpJv7
 9JVlb2oi2ZZBJOg4cF+FTL8G8iN1iD4P4HAC145b5z3tE5eyuOK7RZF
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5MSBTYWx0ZWRfX2dOB77k0oKQt
 qmhB6KLO2sa5gR5iNDOHD4wjVZC2QdD+1kiXK68gC7kretiRv0H7+iBsnVeMGFL4CYVxGafudVG
 jjEpjl0fBu5SrwNLj7R7reDd9V9L/f01siFmJLXwh6YXpbhdyWtCQdavq2M8DJW+UV26OAWhAn9
 IXwp4Sw1cpyyWoicbVu0syNIML5/kN7BfvukU37BByGziBw20i7L7zD1vACjqmF+9Xi5z+SL1TD
 C6jRykGwMlyO4NZcbg+r74zwmBLmiGzoSw81VFjl7f01HqTNG6mnURRjYEsto2QrlQuFOlfq7uK
 OEI16HD/SXWeoEJhzQoYA0jNiFmmqyR7RsGHRZcl3EJJ1IlxQE2XPhpm7QoM5q3XM7ZjoN98VcM
 8O61+jMhml86IbBlTh5SQiW+o7H8Ixh8fgENFD/y7newBqEiJnOnuvBDC+euW7R8jXT7p297
X-Proofpoint-ORIG-GUID: oIP713PqGHZ3c-mdGqHljV78chURDg8f
X-Proofpoint-GUID: oIP713PqGHZ3c-mdGqHljV78chURDg8f
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682afd3d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=JOcJ30pghDwnvxMqNTgA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=955 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190091

Export pci_set_target_speed() so that other kernel drivers can use it
to change the PCIe data rate.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/pcie/bwctrl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index 3525bc0cd10f1dd7794abbe84ccb10e2c53a10af..02c544c6186b8c6b87730d1c924f07858571d2ae 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -214,6 +214,7 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pcie_set_target_speed);
 
 static void pcie_bwnotif_enable(struct pcie_device *srv)
 {

-- 
2.34.1

