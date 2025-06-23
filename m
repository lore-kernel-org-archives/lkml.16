Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com [203.205.221.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B24424502E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750682463; cv=none; b=Tn/vEib5fy91RLUoExXlt0mVzIKEbzBZiO21mr/qTnQXZP3r4ZKOsGZpgbrmgOSSx/4cDX1xt/eZG2OY005cMqxhK1QqU6rvHrlIA3403jRjohLaXHq1BcTNJ41LYi1orgcDnCtP/cSWvx7x7M9enbOe72ye7OIWfK39e9+Olas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750682463; c=relaxed/simple;
	bh=iT7GdTDdx4RD8WRLUiWXNcmgn8JzC6wcwrzqArxQ1I0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ZhJAHf7ku/IIydfPcsdX7mE+vnNA6HZF9+jUHWsLz2IGWgbDLP7m4z7wkFOtUeqjVK0P6WlAnOHvINYbe2KabFzolLX4XLuQBJZXk3ruik6EdFliGa66vZDc8C7g/E42eYthCPl+gfytCsNuzE86KcS4YnqKLOVj/7ce6QzABgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=HfohYgU3; arc=none smtp.client-ip=203.205.221.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="HfohYgU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750682149; bh=eSKOfPTjF7Oxq7Sj+6l3Lp4+ZX2TRn/tyuWF2vbR4ow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HfohYgU3iw2o58u4i8QoMVpI/jatXbktixVWtjUPKQQ9NJ/9X7+xZzRI+iyhSPUj9
	 Vk/0GC/Uctk9XRk758DzNWxQfAdB23XOO3atpBiv2Nr5OJGCLxwoqMecIR6kkiz4gr
	 HHT63GUdiyzxiBWW8Cm8s5COpz/GJV6wSVs49DBY=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 765A8659; Mon, 23 Jun 2025 20:29:37 +0800
X-QQ-mid: xmsmtpt1750681777tkp2ub4qz
Message-ID: <tencent_C2882DF56C089420E9D2EC4ECD707B926F0A@qq.com>
X-QQ-XMAILINFO: Nq1uWKlIb9DMYa5VezLUI+0Tn1gGXrMs0ALXkf3CDcisCrk+X9opP1XBNy3wIV
	 EnFl2XXBq7BmlgSedqAhztQZZ4XaZl6kD7cpml5W2+b8Qag7gQypSipsmckiHGjcoPYyuVGcWE8x
	 vM8rbRKjPxZZQPHCWX3JQhjA4HTHqDV0i7W6wtiAWEJ+187PLgBQi62XMlqKM8KXwKZDvLEJ5xF1
	 dQC6F/acp4rbyCCcc4jTF6uIoB9EXBDzseSOVy4rQ15Q85sbl9uHfj1WhXdsModXRU22hEWfUCmy
	 oX9iuF/FQOlxRHuCLUS51mH/jCri2hGvghLA17OxB4GXPXPjT/SVftx6ZUhTBfy68KjOklgt30No
	 MgXsBSYYgO8moknWnjWmzOOAh4tnkpgaIs6IUOHIe/sLItnpydCvNw4yn6KoF+mp1MjdPnti21AU
	 wUPbdsbvUaVpOKHZ2bYc2M9k82kF9ugxUCm2/hw81ZckoxBofDewxv9V4F/XRze1xPt9Dy6P2Z6x
	 6NfnKDv00h55Iud/1g8NF6uxDni3Raq0piopYx47WLwmtSaOCwgpGxjBx0ixwrvaepWEQoQuFt5c
	 f2Iksub3nM+1Xw/o4+3pYpKd+8n11DrvCgq+ZZU8PtLXGIum4CXsP1SPVtnjWbSuT8vTY6JncT3U
	 qRRS50ZO1ee5du87Z3X6nA4sM/yfRPVCWX4SpxnfwHA7lS2svO2AGi0UfbnFE1tbw/KqhSDvd9B7
	 JkH6XwMByB1Pq7hymFx3ypMVhU4QTi0LlwG1KhJelZgzMNF9qS/3f6ZSa0Qjnu/WZN1A8JcZq3Ms
	 wl+yRxsV5UbN5SohWLXgPD+4I8S+EcR8kVZUxXSNeudRzljYgEaOMFgOgcOLzdoU/ldd6PjtC0VG
	 79waVzQZBV9x8Vvnf/DxsVxVFUxKEZgmjAdDwq2/12NqoXKzgXY170C8peKPiKdCg+QfX5BlPRBv
	 /5/IVlgxw=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+9b9124ae9b12d5af5d95@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl (3)
Date: Mon, 23 Jun 2025 20:29:37 +0800
X-OQ-MSGID: <20250623122936.3597388-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
References: <6854a3e6.a00a0220.137b3.0022.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/drivers/misc/vmw_vmci/vmci_host.c b/drivers/misc/vmw_vmci/vmci_host.c
index b64944367ac5..4e500a8924c2 100644
--- a/drivers/misc/vmw_vmci/vmci_host.c
+++ b/drivers/misc/vmw_vmci/vmci_host.c
@@ -293,6 +293,8 @@ static int vmci_host_get_version(struct vmci_host_dev *vmci_host_dev,
 #define vmci_ioctl_err(fmt, ...)	\
 	pr_devel("%s: " fmt, ioctl_name, ##__VA_ARGS__)
 
+static DEFINE_MUTEX(init_rec_mutex);
+
 static int vmci_host_do_init_context(struct vmci_host_dev *vmci_host_dev,
 				     const char *ioctl_name,
 				     void __user *uptr)
@@ -922,7 +924,9 @@ static long vmci_host_unlocked_ioctl(struct file *filp,
 
 	struct vmci_host_dev *vmci_host_dev = filp->private_data;
 	void __user *uptr = (void __user *)ioarg;
+	int ret = 0;
 
+	mutex_lock(&init_rec_mutex);
 	switch (iocmd) {
 	case IOCTL_VMCI_INIT_CONTEXT:
 		VMCI_DO_IOCTL(INIT_CONTEXT, init_context);
@@ -957,13 +961,16 @@ static long vmci_host_unlocked_ioctl(struct file *filp,
 
 	case IOCTL_VMCI_VERSION:
 	case IOCTL_VMCI_VERSION2:
-		return vmci_host_get_version(vmci_host_dev, iocmd, uptr);
+		ret = vmci_host_get_version(vmci_host_dev, iocmd, uptr);
 
 	default:
 		pr_devel("%s: Unknown ioctl (iocmd=%d)\n", __func__, iocmd);
-		return -EINVAL;
+		ret -EINVAL;
 	}
 
+	mutex_unlock(&init_rec_mutex);
+	return ret;
+
 #undef VMCI_DO_IOCTL
 }
 

