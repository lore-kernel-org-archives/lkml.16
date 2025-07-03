Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02F52D8DB9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 09:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534800; cv=none; b=nF6wCD9xdV2rVDkNg79t7XLPElLfdjcOs4K3gjuyIp0XA8eeeFNAPNhmXHUOwlEEhk/WuPiAF7RzB2xtUSKb7EQmD3PbgcZ5u0lBW6NveMF8qEr7KwIGWHBPwwOaRN8wIPin1FWxFyCK/jHX7P0m8QWNwfCwv3TmdEGcCoFmlN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534800; c=relaxed/simple;
	bh=PUGyVN4OJqSqheGuV7u25IOAaInhgOsYis9mxDJwLeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzydfyKCEm5Wbhl4ST7Zx+JsqLe17ocuEV3cQ3H1hpNyX4zJKHfslR+d3mKDKcFSK5V7ocK35JFAZPioLt2CwRkujeOe7bke76kmjo9mRW7cnVKMC+exRwCfViQgBL/Qw7H77ZgjTcc4KqndgoH6nYBmD0oEQsS37ZSFzis6jAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KUHP7OWv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KUHP7OWv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751534797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/PjBes3xfnhRnjsZQuw1IljDm3PZO9lLi6jhdLLbvQ=;
	b=KUHP7OWveXLHAwxHTvqQjbm/kKP72mEbrNBS/swNeR8vHOtK88KcSqhRNasJ4CVfgJaLY/
	f2XEiFh5cdDXZqnsH6t2/INIxdQdIBHF+p6oYogb3+ysVBPM/5NGPPDTzUMBhvRBCGXToO
	rJlX+avFiSZELyOhX/xvRnjStfanFMI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-0aaJju2kNjCDYiZmR1iA3w-1; Thu, 03 Jul 2025 05:26:36 -0400
X-MC-Unique: 0aaJju2kNjCDYiZmR1iA3w-1
X-Mimecast-MFC-AGG-ID: 0aaJju2kNjCDYiZmR1iA3w_1751534795
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so3290642f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 02:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751534795; x=1752139595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/PjBes3xfnhRnjsZQuw1IljDm3PZO9lLi6jhdLLbvQ=;
        b=PxLeMybtOMH2ux/N0C5VfdQ7gN6yEMRPA1CYBp1R49KHjfuhaGs+INqoH0LLbFy5FA
         5g1aMzkov2GvU+29CusdqobOxotjmI5ZHPobY1t3q3TqQFtE7Uup6PyM78cnN970YgXC
         HOijAKxCya0O9JlRSyozvKcG+2ieG4EmW7jNsId+CT688zvxZdoxa5bN/yx44gquNT3m
         IzxVSQK7c4LpWWjaeMJyZnw8UHdDVlhoYiALe8HN0cNBphDwCVEprgkT912KozKa5L1b
         b/88hcvaQOYaV3xt1crIUKXCUzkRlpycMtHLJTbpOVqqkjMWpXDE7jA76zFxGKnnM8/G
         UsnQ==
X-Gm-Message-State: AOJu0YwRxGpuhrht8ySjSq++e5gWQXDSnK/3L5SLErvayQslBXqnNxJH
	vBsBbgECYLcwXGwhDnVa1a8xfsNiUhzprARKP36QvayxwitIAhe5JWMxnVo/UjajgJsFKAIR+1X
	TWx48DxG5Xbun5JeF+gH0/n9+w3LnXto7/dYkkGfAE14C0+w2DeGSDT15Ph2YgPf0zwUe+SB0Y+
	4k+WFVgf9RBJ41NXeN8NFRTQH5lL8C6MHI7TKPu84mWaE=
X-Gm-Gg: ASbGncsOyO0uCVkmc1FJdWqlAHpaylueufwA4SH4LXPqWoTFE1uUnCLMTGFS2g73vZg
	SRHdhJ931FjsVFXTp1eKdT/8XZIi5NhjmTYi19Mik4YY1dfxndHCmIG8KkWVw2AzrnQqO9350kp
	285uw2UiAbP2imrSm9XPWbghP4Z2qUgBFkA/0GXj3qJmRwLmNtLd9VWU7hmccmJ22cMqBNdRy53
	A2j5frotXNLNBSExlRScj7qWXlg439vl+hDYKl4CIkUJYsLFUZhjMq1zXBNO8ur3ZepsiqRcGMR
	QqFdcDZXaikXgVeX
X-Received: by 2002:a05:6000:22c5:b0:3a3:6e85:a529 with SMTP id ffacd0b85a97d-3b32e5209b1mr2046008f8f.51.1751534795063;
        Thu, 03 Jul 2025 02:26:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfswN2F1WSnecEwI4IFFwD4JVrRDEDFHdlQdrbIQbLQDH7ysTzQt9L3uJYclxAObpUi6v/jw==
X-Received: by 2002:a05:6000:22c5:b0:3a3:6e85:a529 with SMTP id ffacd0b85a97d-3b32e5209b1mr2045960f8f.51.1751534794544;
        Thu, 03 Jul 2025 02:26:34 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997af9esm21221155e9.14.2025.07.03.02.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 02:26:34 -0700 (PDT)
Date: Thu, 3 Jul 2025 05:26:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Lukas Wunner <lukas@wunner.de>, Keith Busch <kbusch@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Parav Pandit <parav@nvidia.com>, virtualization@lists.linux.dev,
	stefanha@redhat.com, alok.a.tiwari@oracle.com,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: [PATCH RFC v4 3/5] virtio: pack config changed flags
Message-ID: <ae1546541834abe3296c6341f6dd02a73a49f29a.1751534711.git.mst@redhat.com>
References: <cover.1751534711.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751534711.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

In anticipation of adding more, use bit-fields instead of bool.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/linux/virtio.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index 64cb4b04be7a..be0beb16b487 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -149,9 +149,9 @@ struct virtio_admin_cmd {
 struct virtio_device {
 	int index;
 	bool failed;
-	bool config_core_enabled;
-	bool config_driver_disabled;
-	bool config_change_pending;
+	u8 config_core_enabled:1;
+	u8 config_driver_disabled:1;
+	u8 config_change_pending:1;
 	spinlock_t config_lock;
 	spinlock_t vqs_list_lock;
 	struct device dev;
-- 
MST

