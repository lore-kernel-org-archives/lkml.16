Received: from mail3-163.sinamail.sina.com.cn (mail3-163.sinamail.sina.com.cn [202.108.3.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1882B7462
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 04:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751517351; cv=none; b=NpOr/dGeRoYK099nYvv3FasV9XR43qVW+9ZsrOdlAtaM/I5zc3s7Rr6xthkm9mkOwWUMoeYv4DO8sJQaBgikmBw3S5kaQKtPp/QikIW7UWqFWlmUfPPsNQ0BHyuBMUER9SKVcDbsudFxMrqRU09FUFTND0Ij0DxLnNJF+/vIBcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751517351; c=relaxed/simple;
	bh=J/J6QUbY1q/g4lVgksKLha2XvcN0S8B9Qzy5idUgyHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VmiU+xi3kIJ4D2tfOscxHAlPj0zc7y0qAUuB7mNH1DbsYHZuWCrcBVPq6wKZzQiDNW40i673MEydLpIStnsnj4/fTwVBOi1b0M6QJ6xuBHs0ZVLbo2vhjojdSb33/3aXk9EaA+entqt2xYIF/5EX+dx8SeJ2+OfAuNteH9xdY0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=y1CoLlvD; arc=none smtp.client-ip=202.108.3.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="y1CoLlvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751517345;
	bh=NzWzVDaMeXv9EE6RfrnyMYSAutQzV0Vq0MQ3QytLAus=;
	h=From:Subject:Date:Message-ID;
	b=y1CoLlvD5XZDX7+MFFxzEMYR2uHRkzGd4Nr6peSmirzWW2dqvWzgSfOq/uTrUkMFI
	 ZXWE7S464RLRBNwzbpdMKZrv/8DMisssde63kKvdg0N6wrbCzE/AXTwu+NT4oD9o7V
	 lmiJDqGW4d10AA2CNghcuyb/bnv2yQJ/44yo9E/E=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.34) with ESMTP
	id 6866087100007CC7; Thu, 3 Jul 2025 12:34:59 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3783316291934
X-SMAIL-UIID: EA626DA316954629AE04AAB32050E82F-20250703-123459-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] KASAN: slab-out-of-bounds Read in mon_bin_event
Date: Thu,  3 Jul 2025 12:34:47 +0800
Message-ID: <20250703043448.2287-1-hdanton@sina.com>
In-Reply-To: <68656f81.a70a0220.5d25f.0447.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Wed, 02 Jul 2025 10:42:25 -0700
> syzbot found the following issue on:
> 
> HEAD commit:    1343433ed389 Add linux-next specific files for 20250630
> git tree:       linux-next
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=1370d770580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=66357ac5b0466f16
> dashboard link: https://syzkaller.appspot.com/bug?extid=86b6d7c8bcc66747c505
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=129b2ebc580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1770d770580000

#syz test

--- l/drivers/usb/mon/mon_bin.c
+++ y/drivers/usb/mon/mon_bin.c
@@ -603,6 +603,8 @@ static void mon_bin_event(struct mon_rea
 	}
 
 	if (length != 0) {
+		if (length > urb->transfer_buffer_length)
+			length = urb->transfer_buffer_length;
 		length = mon_bin_get_data(rp, offset, urb, length,
 				&ep->flag_data);
 		if (length > 0) {
--
