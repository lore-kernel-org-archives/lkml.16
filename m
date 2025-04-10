Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D10328D83A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744290390; cv=none; b=OqSU2xAAxH/1by+3N+Y3xxCj7drBek1Ubh7yo6qZWjQArAjqrglgt94xs8TE8mGcr+OKl5yH6C43Yh1QWs/UxAquU1OklQ6LRtS8xgIYerHuwTS2QYAsxqyHB/xbJKuucinnTikRYPRjhlTWBbehe4T8IJvGdQtq3sPe4Sf4Ewo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744290390; c=relaxed/simple;
	bh=cnOuUiTe3Ho5T4fYaHsNPW7c89nIldGijKaXdVhE6n4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NNK4av/tEfoMER3DYBwtLRgcMP/4VITLw/PgCnOtnR4tr8kgUQv1BvLrJELSUBRb46agq/zVHeP2GFGEBEFvpcU+MKfosVDE4dC9DspMr7y6frnNxJ+D+Sl9E0GNPDm/LV6u/kE4+lyYY7j7aqBWbO9do/GWrWL03dfYjKRvqQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQoBHaao; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQoBHaao"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso6015585e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 06:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744290386; x=1744895186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KpF9SfZWwknZK9NjJkeKkgsOEETiClwbvQ0kGUScvk=;
        b=mQoBHaaod9CbDYChlghlnu0pZpqmrayNpITKewTXioVNp9AaNWV2LjZqCkg7YYTT0w
         2sYj4ytT9+BnntwQ/F84dcXjWVWHu9EFb3FmYi63Hypt4yqkhQg7vBTe52v49We5BQF1
         4uvwJ5PluLQF6Cbidudd23Ax+xRljutWXfcgpTvr+sr904Q2bBkCDe80JEfkKWU2lvt8
         2ir1fWrYa3/npLvNQrZLhQZrEKT1xw1F1JjqBkWgTp69b1M+UTh3FUaJX5ZEM1zN7Nv2
         fN6atcc3XOUVs+H0SHxXmG9OH+6afi/07amz9TMMMc8uO5/dYzTro6JJQQruPHoxQOFw
         uvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290386; x=1744895186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KpF9SfZWwknZK9NjJkeKkgsOEETiClwbvQ0kGUScvk=;
        b=EWfVcmHB9Qi6Dwsw4wWFsV4NqbD7ieQdRbv3SHmp9oS5cKqOObDS+zmJkl0o4EUWJH
         xv4jDGuYwhl6qrYnQ8kijkQgp+vwT5KDw49ddVgSgmnuoOugLrp4QooGQLizjnViFVEB
         XWYQ9QxtSYGxjuzqNnXllyzwDqYKuxmq+gm3xaJdZOgJVDuhoctjsPPcb6cfPjr/aPR/
         z7Vy69xZ/HLc6wxfXlLu0zrx26bmi3XnA84mPTfA9Rzfb/zZDsUdm3AaJ5mp6cC95uz5
         eNOdkb1Ch8IlM69MecG29K+r8DoKcfaldrr53mPFcCCTKTf5UGyNxvGl16C+kcaGRytF
         lEeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxzJr/WmZ0yuYr0Zx3UfooATCSOan50HwU10ZvOz9f1PHmfsLfVvpQJ0/QYD6+UlN1MJ65KC1MuJzqS2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYqginXsThibs26rF/GvZuyJ0FijgJUJHfNgTguRC2VE3pJNUG
	icLYkqcUdg40Ipl6s2ktHNQyOp5rpUY9rbRe6h7pSWusBw8nkZk7
X-Gm-Gg: ASbGncul1vvGijqcASTD1qfs+tcjQYbnoDlsiCm+BpK3vdsC4uh7liqWDWnlyU+jtUW
	Ik70jTrBRdg3grRREfbAmSw3qip3Or47tjbximcyRtVwv1QLx+LqKo5BXUg2M9d/AnCVFGiZIuK
	jPTQpKPJK8CSA6kx+nZJ4sy0uZcrXP0WL6wtAUyiKz0qCd9FA3A5mfMSiQUfsf+8W88UIYFDBeb
	SHH6kF7g/t9a15V7RlvQcBALU1bYbO+Ys6uSkCNoW4RoCIENGrkfrNyYUAWoEJOwHKzmU7Rsr3c
	B6u0s2ObI+UVOI+/5hOdetPOdtyzPtBbVLmbRw==
X-Google-Smtp-Source: AGHT+IEXxWXeDdUFKg0JMdVhDar9E3Hqv/jvd/iAbcSOtIAVNlERHeywklQ8I5H/mrccs+8fJdXc+w==
X-Received: by 2002:a05:600c:4e14:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-43f2ff9af48mr18725805e9.21.1744290386034;
        Thu, 10 Apr 2025 06:06:26 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc6dsm55013045e9.28.2025.04.10.06.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:06:25 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] staging: rtl8723bs: Improve code readability in sdio_ops.c
Date: Thu, 10 Apr 2025 16:06:06 +0300
Message-ID: <9c8473662caa96a8d312415e9006f74f48098f98.1744285781.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744285781.git.karanja99erick@gmail.com>
References: <cover.1744285781.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the code more readable by moving trivial
initializations up with the declarations instead
of wasting a line on that.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c | 59 +++++++-----------------
 1 file changed, 17 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 8736c124f857..1e03413e242c 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -53,9 +53,8 @@ static void hal_sdio_get_cmd_addr_8723b(
 static u8 get_deviceid(u32 addr)
 {
 	u8 devide_id;
-	u16 pseudo_id;
+	u16 pseudo_id = (u16)(addr >> 16);
 
-	pseudo_id = (u16)(addr >> 16);
 	switch (pseudo_id) {
 	case 0x1025:
 		devide_id = SDIO_LOCAL_DEVICE_ID;
@@ -150,7 +149,7 @@ static u16 sdio_read16(struct intf_hdl *intfhdl, u32 addr)
 
 static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 {
-	struct adapter *adapter;
+	struct adapter *adapter = intfhdl->padapter;
 	u8 mac_pwr_ctrl_on;
 	u8 device_id;
 	u16 offset;
@@ -160,7 +159,6 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 	s32 __maybe_unused err;
 	__le32 le_tmp;
 
-	adapter = intfhdl->padapter;
 	ftaddr = _cvrt2ftaddr(addr, &device_id, &offset);
 
 	rtw_hal_get_hwreg(adapter, HW_VAR_APFM_ON_MAC, &mac_pwr_ctrl_on);
@@ -196,16 +194,13 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 
 static s32 sdio_readN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
 {
-	struct adapter *adapter;
+	struct adapter *adapter = intfhdl->padapter;
 	u8 mac_pwr_ctrl_on;
 	u8 device_id;
 	u16 offset;
 	u32 ftaddr;
 	u8 shift;
-	s32 err;
-
-	adapter = intfhdl->padapter;
-	err = 0;
+	s32 err = 0;
 
 	ftaddr = _cvrt2ftaddr(addr, &device_id, &offset);
 
@@ -262,18 +257,15 @@ static s32 sdio_write16(struct intf_hdl *intfhdl, u32 addr, u16 val)
 
 static s32 sdio_write32(struct intf_hdl *intfhdl, u32 addr, u32 val)
 {
-	struct adapter *adapter;
+	struct adapter *adapter = intfhdl->padapter;
 	u8 mac_pwr_ctrl_on;
 	u8 device_id;
 	u16 offset;
 	u32 ftaddr;
 	u8 shift;
-	s32 err;
+	s32 err = 0;
 	__le32 le_tmp;
 
-	adapter = intfhdl->padapter;
-	err = 0;
-
 	ftaddr = _cvrt2ftaddr(addr, &device_id, &offset);
 
 	rtw_hal_get_hwreg(adapter, HW_VAR_APFM_ON_MAC, &mac_pwr_ctrl_on);
@@ -300,16 +292,13 @@ static s32 sdio_write32(struct intf_hdl *intfhdl, u32 addr, u32 val)
 
 static s32 sdio_writeN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
 {
-	struct adapter *adapter;
+	struct adapter *adapter = intfhdl->padapter;
 	u8 mac_pwr_ctrl_on;
 	u8 device_id;
 	u16 offset;
 	u32 ftaddr;
 	u8 shift;
-	s32 err;
-
-	adapter = intfhdl->padapter;
-	err = 0;
+	s32 err = 0;
 
 	ftaddr = _cvrt2ftaddr(addr, &device_id, &offset);
 
@@ -388,13 +377,11 @@ static u32 sdio_read_port(
 	u8 *mem
 )
 {
-	struct adapter *adapter;
-	struct sdio_data *psdio;
+	struct adapter *adapter = intfhdl->padapter;
+	struct sdio_data *psdio = &adapter_to_dvobj(adapter)->intf_data;
 	struct hal_com_data *hal;
 	s32 err;
 
-	adapter = intfhdl->padapter;
-	psdio = &adapter_to_dvobj(adapter)->intf_data;
 	hal = GET_HAL_DATA(adapter);
 
 	hal_sdio_get_cmd_addr_8723b(adapter, addr, hal->SdioRxFIFOCnt++, &addr);
@@ -432,14 +419,11 @@ static u32 sdio_write_port(
 	u8 *mem
 )
 {
-	struct adapter *adapter;
-	struct sdio_data *psdio;
+	struct adapter *adapter = intfhdl->padapter;
+	struct sdio_data *psdio = &adapter_to_dvobj(adapter)->intf_data;
 	s32 err;
 	struct xmit_buf *xmitbuf = (struct xmit_buf *)mem;
 
-	adapter = intfhdl->padapter;
-	psdio = &adapter_to_dvobj(adapter)->intf_data;
-
 	if (!adapter->hw_init_completed)
 		return _FAIL;
 
@@ -487,14 +471,12 @@ static s32 _sdio_local_read(
 	u8 *buf
 )
 {
-	struct intf_hdl *intfhdl;
+	struct intf_hdl *intfhdl = &adapter->iopriv.intf;
 	u8 mac_pwr_ctrl_on;
 	s32 err;
 	u8 *tmpbuf;
 	u32 n;
 
-	intfhdl = &adapter->iopriv.intf;
-
 	hal_sdio_get_cmd_addr_8723b(adapter, SDIO_LOCAL_DEVICE_ID, addr, &addr);
 
 	rtw_hal_get_hwreg(adapter, HW_VAR_APFM_ON_MAC, &mac_pwr_ctrl_on);
@@ -525,14 +507,12 @@ s32 sdio_local_read(
 	u8 *buf
 )
 {
-	struct intf_hdl *intfhdl;
+	struct intf_hdl *intfhdl = &adapter->iopriv.intf;
 	u8 mac_pwr_ctrl_on;
 	s32 err;
 	u8 *tmpbuf;
 	u32 n;
 
-	intfhdl = &adapter->iopriv.intf;
-
 	hal_sdio_get_cmd_addr_8723b(adapter, SDIO_LOCAL_DEVICE_ID, addr, &addr);
 
 	rtw_hal_get_hwreg(adapter, HW_VAR_APFM_ON_MAC, &mac_pwr_ctrl_on);
@@ -566,13 +546,11 @@ s32 sdio_local_write(
 	u8 *buf
 )
 {
-	struct intf_hdl *intfhdl;
+	struct intf_hdl *intfhdl = &adapter->iopriv.intf;
 	u8 mac_pwr_ctrl_on;
 	s32 err;
 	u8 *tmpbuf;
 
-	intfhdl = &adapter->iopriv.intf;
-
 	hal_sdio_get_cmd_addr_8723b(adapter, SDIO_LOCAL_DEVICE_ID, addr, &addr);
 
 	rtw_hal_get_hwreg(adapter, HW_VAR_APFM_ON_MAC, &mac_pwr_ctrl_on);
@@ -839,11 +817,8 @@ static struct recv_buf *sd_recv_rxfifo(struct adapter *adapter, u32 size)
 
 static void sd_rxhandler(struct adapter *adapter, struct recv_buf *recvbuf)
 {
-	struct recv_priv *recv_priv;
-	struct __queue *pending_queue;
-
-	recv_priv = &adapter->recvpriv;
-	pending_queue = &recv_priv->recv_buf_pending_queue;
+	struct recv_priv *recv_priv = &adapter->recvpriv;
+	struct __queue *pending_queue = &recv_priv->recv_buf_pending_queue;
 
 	/* 3 1. enqueue recvbuf */
 	rtw_enqueue_recvbuf(recvbuf, pending_queue);
-- 
2.43.0

