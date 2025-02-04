Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2AF202C34
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 06:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738651234; cv=none; b=Binf3gE8O9hjlWBSe+MVF5x+9lHZ5LHH563AuIQKkdXHLPEQMuxtEw6s57ZoGcBsAakygpoInzvUggjEpxvQ9aJtImPvMuUq7sCv/U4ORLgjQZWuu9ErOiXrZmjspwvBsyAbffg72SqsNqcvubf+wN4cmprLicWSGEdO7td1ej4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738651234; c=relaxed/simple;
	bh=fOwWv1gZwnLf/+v3FwvdRON3bX8Gi+qFEqOdsDKJpTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwflWOp1bMUBidio6DkpvtDqfJkIRXu8qsetsg5oor9As5Pe2Q+oKL0vUFueZRNxDuityRbMuPgwTy6Fx4lw/L4AzGrp3wqahsvX45TB/SPoTLnodYiMGjX/bkKFVBnttF6yON6TcRsyvDHhhd5epb/KvkhpO/Q0agkKblHdJY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=h3Sy3N+u; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="h3Sy3N+u"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51418WAS023687;
	Tue, 4 Feb 2025 06:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Bmu2NfxBJmQ6gqOqZ
	RLy32sFY4UHusj9U2Ai/TdFp9s=; b=h3Sy3N+uAuoFpvNjlUDEkjmThFeEjW2fY
	5zGOxKEhUG8+vepzMeCoSiNAJn0B0TG7oirXpMjL6opBZTekY5L8ms8XGGVdlV8p
	jWHrDcXU/76Ut3lLIxvB0SAM9xx+e9QGFMhjmWV30g85XJu2hhr35FUDjXRmPNC6
	qFqLle4BsWjHz9jvttwgfEo38+CZKbRY6+at3nIwgNMEhcxGYYu68iDPRfuH41jy
	khUvb59udCYTAHqGrkY0C2FQXsvagQs8WnPT1dfcGqR7/gKrHVGa/Mcn1J+rqC2R
	aq9DxkBpeEyLS0WvMzRAH6+hKFFExc4aB8KXR5MgL0jbH0Vb+ZKCw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44k8y9h6ta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 06:40:28 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5145hLn6021483;
	Tue, 4 Feb 2025 06:40:28 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44j0n19u6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 06:40:28 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5146eNJw55771550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 06:40:23 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5909D20084;
	Tue,  4 Feb 2025 06:40:23 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6ABDA20082;
	Tue,  4 Feb 2025 06:40:21 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.13.87])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Feb 2025 06:40:21 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: maddy@linux.ibm.com
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, disgoel@linux.ibm.com,
        hbathini@linux.ibm.com, adubey@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        aboorvad@linux.ibm.com
Subject: [PATCH v2 3/3] docs: ABI: sysfs-bus-event_source-devices-vpa-dtl: Document sysfs event format entries for vpa_dtl pmu
Date: Tue,  4 Feb 2025 12:09:48 +0530
Message-ID: <20250204063948.643852-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250204063948.643852-1-kjain@linux.ibm.com>
References: <20250204063948.643852-1-kjain@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0J_iRM-nZpypCps25XSpy2buPNZshci-
X-Proofpoint-ORIG-GUID: 0J_iRM-nZpypCps25XSpy2buPNZshci-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040051

Details are added for the vpa_dtl pmu event and format
attributes in the ABI documentation.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../sysfs-bus-event_source-devices-vpa-dtl    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl

diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl b/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl
new file mode 100644
index 000000000000..39882e0e852d
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-vpa-dtl
@@ -0,0 +1,25 @@
+What:           /sys/bus/event_source/devices/vpa_dtl/format
+Date:           January 2025
+Contact:        Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
+Description:    Read-only. Attribute group to describe the magic bits
+                that go into perf_event_attr.config for a particular pmu.
+                (See ABI/testing/sysfs-bus-event_source-devices-format).
+
+                Each attribute under this group defines a bit range of the
+                perf_event_attr.config. Supported attribute are listed
+                below::
+
+				event  = "config:0-7"  - event ID
+
+		For example::
+
+		  dtl_cede = "event=0x1"
+
+What:           /sys/bus/event_source/devices/vpa_dtl/events
+Date:           January 2025
+Contact:        Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
+Description:	(RO) Attribute group to describe performance monitoring events
+                for the Virtual Processor Dispatch Trace Log. Each attribute in
+		this group describes a single performance monitoring event
+		supported by vpa_dtl pmu.  The name of the file is the name of
+		the event (See ABI/testing/sysfs-bus-event_source-devices-events).
-- 
2.43.0

