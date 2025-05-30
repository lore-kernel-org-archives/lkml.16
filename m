Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76181235065
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 20:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636328; cv=none; b=i4kD94W6r5nPhjs9IQnDIgRxpWnxCmB+HmKoUJMDEGFSJYrep7JuynOfzkLLLFdrXp5b4R85pfobor/mpffbRspz8zpfvBujb6+TxhzjmJ6ZJocHavyLTpX0jRB+TyPWpR3f35tGX4K8Xrlgx31Igm14xZPGkK1s0H3Z8n7IUs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636328; c=relaxed/simple;
	bh=oTyBlYmtNHKEVcKuoFTfsW9EOF32BnRQAt8PNwXWb/E=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BMKwwrHEFi1DBRy4LhghLiD5iS+kIB6XcFsrmYYE1yOEJbfseUIkI0vu1O5KnzrCWg6o9w4mkdgdnPFp2w3/bjRw71dJFFMQTk2S4fXSXHKsLyCGjQwy50npiSVFdjMoBvqwcTi0jOXXWbwNY6zh98/nR1dicDhRQ4H20OTzLhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3dd759fd518so30719685ab.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 13:18:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748636325; x=1749241125;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OBWDFRlOJGi9MAhtEAaoFqG2Wmig9qczjmcWKJlklII=;
        b=QnHO2eoIbg8BxXDPtd2nqdKFx7EdaN6zp/REX2ZezSs5HNpnu6fwNkYGvDafEPlW5v
         BnmzbIZmaBnQ3PxRDlzaYPoEfkOJW4+nsYWOk5XADlBEMq8tRKZzzorB8PVKky42PmeN
         n4o42xuqjPcEo0LLMRIP8+ybq0rKM8NkWLAs066Gsp4wrpoLzR4y1c5EsJrj1TLxIPdH
         paWubHXxfnz/yk0IcZnYrgabQCiEsxV/AiYyPuczC8sFPJz9SK49K9E38ZpMG7MtcaAk
         qOCr76cmia65IqKar9T+mg5KFk6Ez17lu++k4nzWqBdbeQqA1rzEOFotktE/LIxvLFX+
         UGRA==
X-Gm-Message-State: AOJu0YxiBlmak/maQWf/fyrAXogAEcwkE8wViEnbrRrEr3YG9xmaagbF
	tm86+2kr/CmIv+0hlFMdnuJ38NG2q76Y9dne2GLLOASM+2HLGkFZ24ewF47/L1RGhfgo3K3S2LL
	DEOy6hYqMIQtVB+2EyKvQ4n9M0Dmlmnai3GtZzhjENf6iOFd6NwvuN1YLj80=
X-Google-Smtp-Source: AGHT+IF73XmqCcsz67DzWJLKu7c59M+5+DnpyusKiBszdeolWjiZNnezww5hoswVuwfRlpNDk+w2Pe+HLE4S9MZopGFK6XzwMfgi
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:198b:b0:3dd:752f:53c3 with SMTP id
 e9e14a558f8ab-3dd99be40efmr49257135ab.6.1748636325461; Fri, 30 May 2025
 13:18:45 -0700 (PDT)
Date: Fri, 30 May 2025 13:18:45 -0700
In-Reply-To: <683837bf.a00a0220.52848.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683a12a5.a00a0220.d8eae.000d.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [net?] possible deadlock in rtnl_newlink
From: syzbot <syzbot+846bb38dc67fe62cc733@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [net?] possible deadlock in rtnl_newlink
Author: jdamato@fastly.com

#syz test

diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
index 3f089c3d47b2..d8595e84326d 100644
--- a/drivers/net/ethernet/intel/e1000/e1000_main.c
+++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
@@ -477,10 +477,6 @@ static void e1000_down_and_stop(struct e1000_adapter *adapter)
 
 	cancel_delayed_work_sync(&adapter->phy_info_task);
 	cancel_delayed_work_sync(&adapter->fifo_stall_task);
-
-	/* Only kill reset task if adapter is not resetting */
-	if (!test_bit(__E1000_RESETTING, &adapter->flags))
-		cancel_work_sync(&adapter->reset_task);
 }
 
 void e1000_down(struct e1000_adapter *adapter)
@@ -1266,6 +1262,10 @@ static void e1000_remove(struct pci_dev *pdev)
 
 	unregister_netdev(netdev);
 
+	/* Only kill reset task if adapter is not resetting */
+	if (!test_bit(__E1000_RESETTING, &adapter->flags))
+		cancel_work_sync(&adapter->reset_task);
+
 	e1000_phy_hw_reset(hw);
 
 	kfree(adapter->tx_ring);
-- 
2.43.0


