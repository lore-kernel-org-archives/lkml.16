Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFC022170B;
	Tue,  6 May 2025 04:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507184; cv=none; b=mVb/Vl9FOFibUnlURJOLMx9ntYJUG5rWNPGlrMYJQ10OBaYhMBoucAsWpM1loX+Pl4YWr0jlJ4K3GmBRyyS/pdNPNo0ksCizcdJN1VyjgUlOhtr5toXP6+aPD6kZUWK8vWbKdcc+gp+GGSN3aCNgEYygeJxKXYLy/jbf8iru3Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507184; c=relaxed/simple;
	bh=fEeVj4cRrupYC7g3KPf5QbHkGS+baSyRyoHHW08ibtc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qLQFFBaFRi4ubmn1ZplkvVKhQoGUmLAi2ePRbldKvMR2rT9FWnWjC+y2J75lSlKljt8ZlPP2OQMboEsnmhJQVFS1es4/MlWviJu8nJgx1BHCoBdpaBwQpkwJAVFXz5OOHu/qc2LYA3qbu/27gbGC2jUJxwix8AFnRfZn1ghuHMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=xP9bUt6J; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="xP9bUt6J"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5464qVTD431999
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 23:52:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746507151;
	bh=ebRWM+3o09AKqu9Pk0NCzKq3MWq68HrD3704MTKX5uY=;
	h=From:To:CC:Subject:Date;
	b=xP9bUt6JPnXVKEVfQPbB1BRamOJYFyCQP813Taw0FvXZhjO2vhnEsXmDlH9Zd8N44
	 d8CvQ7TjabjshDu6Oa1iBgcWGrP6dAKZ5qf3C3L4+3qkkOmq/6O0iYybkv+xq6gZKj
	 ZJmUfRPQC+wGUYKNztxEN9kNi4ZHGKIU/t12dMvM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5464qVDh050122
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 May 2025 23:52:31 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 23:52:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 23:52:30 -0500
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [10.24.69.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5464qPcT069139;
	Mon, 5 May 2025 23:52:26 -0500
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <s-jain1@ti.com>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <r-donadkar@ti.com>
Subject: [PATCH 0/2] Fix dtbs_check warnings in ov5640 sensor overlays
Date: Tue, 6 May 2025 10:22:23 +0530
Message-ID: <20250506045225.1246873-1-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Fix the follwoing dtbs_check warnings:
https://gist.github.com/Rishikesh-D/2f6e0a11f2f72ce70f75058d0caedc9f

Test Logs:
beagleplay + tevi-ov5640: https://gist.github.com/Rishikesh-D/38ac71408f108147f4de596f260ad7c3
beagleplay + ov5640: https://gist.github.com/Rishikesh-D/7911f4efdc935c22a2c97ff502c73189

Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Rishikesh Donadkar (2):
  arm64: dts: ti: k3-am625-beagleplay: Add required voltage supplies for
    OV5640
  arm64: dts: ti: k3-am625-beagleplay: Add required voltage supplies for
    TEVI-OV5640

 .../ti/k3-am625-beagleplay-csi2-ov5640.dtso   | 31 +++++++++++++++++++
 .../k3-am625-beagleplay-csi2-tevi-ov5640.dtso | 31 +++++++++++++++++++
 2 files changed, 62 insertions(+)

-- 
2.34.1

