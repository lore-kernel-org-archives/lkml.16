Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com [99.78.197.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C2B22A1EF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 09:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=99.78.197.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751707669; cv=none; b=CEEVQ6CnF38ItWaPyJVp59obxPWQF0sZnGQvPc0Yi93mFCQOQ4TIDzZY/DGhoxW2JYCBGrnfhC92jgXkkIUwhiY0DuDHgBcvQSky09A/q6xUMuf0AtXir529UhjZASnkVJVh5ESyjyWVKV1YY0ptA3/P4Ykn1JfywMFg4WZO84c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751707669; c=relaxed/simple;
	bh=2L9qX0nFZeGEqpdhrKt7MRDEJUMAwfr1chFOdINtafo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VVe+8IK4eo6IcC+J73FM+5hVCWZNkdFJD7jwYdI2LX01Z3vgp/XAvo5y1SvDlVFND4LeuPXouuPCN6wX777kVfJb7/2OaXhUzKAenONpR3SVanYA8G3ZB+2NqsvrMOYlfdFVedZmZZO3xwXdZCsRtUCIHZvRuSwkHWtUYOTBG78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b=V8qOu6tU; arc=none smtp.client-ip=99.78.197.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.co.jp header.i=@amazon.co.jp header.b="V8qOu6tU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.jp; i=@amazon.co.jp; q=dns/txt;
  s=amazoncorp2; t=1751707668; x=1783243668;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zTAih9AgCr8HnDuwdusoBQEAfk0aKvxbOaKM8kBB3hs=;
  b=V8qOu6tU6/yCzwX27Vs/XX0JJu600hAa48uRXhueMGuPmcWsZIfIlLfV
   l77/0Exijy9IGkSXa1E7rvRB55u8olQHuugssRZgkTNwwa6qSjuJx9iib
   SOoHaUkOcQ95ORpbVT2KeOj74JfSrRLQjIWxLgdGtIFASzhXsji8cJs9t
   90Ceyy0Qzz5qCsnNEWPQ6YaGNajrmGXAYP2jrZiKzpym9CVjXl8zDHvlV
   z8a3HmNJiopcn/A/HQwJvdQwurj/oS1JGhEahFte3steKCNJC9An+wr/k
   Xi4d/KlY61vV4exDDVKiR0QDjNusmqsbMV95GS/VgoPlp5uIuT/2gFVsq
   g==;
X-IronPort-AV: E=Sophos;i="6.16,289,1744070400"; 
   d="scan'208";a="66676690"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 09:27:47 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.7.35:25960]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.26.102:2525] with esmtp (Farcaster)
 id 102ceed6-4004-4b1b-8b86-4a0fefd58c29; Sat, 5 Jul 2025 09:27:47 +0000 (UTC)
X-Farcaster-Flow-ID: 102ceed6-4004-4b1b-8b86-4a0fefd58c29
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Sat, 5 Jul 2025 09:27:47 +0000
Received: from 80a9974c3af6.amazon.com (10.37.245.7) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Sat, 5 Jul 2025 09:27:46 +0000
From: Takamitsu Iwai <takamitz@amazon.co.jp>
To: <syzbot+398e1ee4ca2cac05fddb@syzkaller.appspotmail.com>
CC: <takamitz@amazon.com>, <linux-kernel@vger.kernel.org>,
	<syzkaller-bugs@googlegroups.com>
Subject: Re: [syzbot] [net?] WARNING in taprio_get_start_time (2)
Date: Sat, 5 Jul 2025 18:27:39 +0900
Message-ID: <20250705092739.28018-1-takamitz@amazon.co.jp>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <684c5575.a00a0220.279073.0013.GAE@google.com>
References: <684c5575.a00a0220.279073.0013.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D035UWB003.ant.amazon.com (10.13.138.85) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

I found validation does not work properly when link speed is large.
picos_per_byte becomes too small when link speed is large, and
length_to_duration(q, ETH_ZLEN) becomes zero. This results in failing
validation in fill_sched_entry() and parse_taprio_schedule(), and any
entry->interval and cycle_time are permitted.

picos_per_byte should be larger than 16 because ETH_ZLEN (60) *
&q->picos_per_byte should be larger than PSEC_PER_NSEC=1000.

This report seems to be related this, so let me check the following patch
resolve the issue.

#syz test

diff --git a/net/sched/sch_taprio.c b/net/sched/sch_taprio.c
index 2b14c81a87e5..b0a5bd1c9995 100644
--- a/net/sched/sch_taprio.c
+++ b/net/sched/sch_taprio.c
@@ -43,6 +43,11 @@ static struct static_key_false taprio_have_working_mqprio;
 #define TAPRIO_SUPPORTED_FLAGS \
 	(TCA_TAPRIO_ATTR_FLAG_TXTIME_ASSIST | TCA_TAPRIO_ATTR_FLAG_FULL_OFFLOAD)
 #define TAPRIO_FLAGS_INVALID U32_MAX
+/* picos_per_byte should be larger than 16 since duration for minimum ethernet
+ * frame should not be zero.
+ */
+#define TAPRIO_PICOS_PER_BYTE_MIN 17
+
 
 struct sched_entry {
 	/* Durations between this GCL entry and the GCL entry where the
@@ -1299,7 +1304,7 @@ static void taprio_set_picos_per_byte(struct net_device *dev,
 		speed = ecmd.base.speed;
 
 skip:
-	picos_per_byte = (USEC_PER_SEC * 8) / speed;
+	picos_per_byte = max((USEC_PER_SEC * 8) / speed, TAPRIO_PICOS_PER_BYTE_MIN);
 
 	atomic64_set(&q->picos_per_byte, picos_per_byte);
 	netdev_dbg(dev, "taprio: set %s's picos_per_byte to: %lld, linkspeed: %d\n",
