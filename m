Received: from out203-205-221-164.mail.qq.com (out203-205-221-164.mail.qq.com [203.205.221.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF0E3FBB3
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743513425; cv=none; b=jAP/oL8rOuiqimdPCk5+got+qKQ04T/XoxgS8xiluZXzr9Eaa2+CwKR81yvVBj9+t9j2FVjiDhYfLfL7I69sbArUb2yZ/RUvvKBgH9L7rF8VhwkWKTdWudt+XLrQ5Xzl+0cLGDS5LZwK6v2RYM+1n5cTvIk30KG5bOUU5Oyn0Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743513425; c=relaxed/simple;
	bh=dyvFc0CDhuS2tuvF73xqRsMp9C5bsnqsj6M8jQob10Y=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=jcVW2jSEKZKG8fLh38RFECpl8bS6fdYxveoHOngsAr2VPQu1CCOhhcl+4ojCDoNBHbK6NS2oDJQwaKVflW/aoK8EBv0wDEqt2P+LaaeyoKIhfy/e/VJQ8fv3DztmbMbmtGR1M+Lb105KzEmSW+cfhdV0KL1MrvrA5x19899f1fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ierj4fAg; arc=none smtp.client-ip=203.205.221.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ierj4fAg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743513416; bh=PixgXrljpb4/o7qJ4iRL9JEHovZX9Akht4artxBMa/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ierj4fAgzRlrzS0UxfID+B2ybM0AdCF4tFSH6ncd2LIuSYyC5GHfFyNQ8aowCpeY5
	 19W2odukR39vDE+anTCUJtaWUwYnd/5EjybFGCF3oahVo63CVhncRRpro+wgEijeXO
	 79gXu8ZRCdG46IOwucNpKbH24Jqrfx2p/DhHwY6k=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszb20-0.qq.com (NewEsmtp) with SMTP
	id 2B0AD26B; Tue, 01 Apr 2025 21:10:48 +0800
X-QQ-mid: xmsmtpt1743513048tw2uqsj7y
Message-ID: <tencent_0677C99FAED5EECC8C85E7D606C892F34606@qq.com>
X-QQ-XMAILINFO: MdoRYM9mYrydGj3geKJotb/VT1BySN2nOto8rjKTsARmh1lp9Jx8Z5b3pHpAdP
	 ZnyemfJwAnI7zRSRH1y4rZymTnmYBSfphUqCZki8GwVvkAjGYBwE/UmFiHEKcowmq3SYfaf6cixD
	 SBrEXTxLk09hb2KW/+TwO7GIVAfEIxIyXiNSaqK9DomW3Ogys1o6e1f13PGkGXzH9WhTMANrdT/S
	 EKUguKW3RzmuV6UcdrHNBD8OcaSiGu/5Qe7wwecdiWeiNu95mllzBPB/hUQuY7rC8da+QI0bcGyu
	 YnayQ7HMSfU14I1hffjQAmhyXg/VAdvYAGSpvJ+qZsufiyFN3ZXHE2xjIleQYonDTZWj5TWQxRzW
	 8vy4dMyj+urwK9AB0tDBWQ7EBu/kBVVEWnN7T2qFu/M0c/m1W3ZGF0Q2cVj5R6yf9ea7BZ5KwWUE
	 5cjTgdo0mQmnN7y+pHjNqWe/wI7ETXOhkVq8hh6HVvYIh99NBc48QoCPbNrEW8k1d1pg8EujzI04
	 kpCYfUiBDkUWrA+XjirF7LcD4zAtcxpGjjPUnZKnOBbZ3kYo/cJWCZ8FBHZuW2FJQ75vyo8fwMYY
	 O+8dmZo8aWVAVoskPeVYTJxuxtsXNJsdlBk2txMHkaNmL5VgERalh/nZathHZO0PnaF7hwc4pQva
	 Ijg+rXFhVVYmr8eBsymmIPPg9DEhO1peUPFDlfE8TTiYxzBWDtZL2BxZbxpouzBEql+w2XIvLW5e
	 ehDN0ov6tbCxP3jyjS5T/DnbP6zzuqUJF1orrxHUVZNqNwduaO+T4MyMAniq1+n2mp+TXLPw50Yx
	 oP/1sZznKFU3NS/OHC5vxGVM435njWY+YwEIfrlrtUXijdmC5RRcB/z9ho+Go0mA2Zkv+Ql6xAdW
	 OB05ISrmGOvVcJMTfbFfDIwFYEQfpKwl03OW+QUW5H
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+5d83cecd003a369a9965@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [isdn4linux?] [nilfs?] INFO: task hung in mISDN_ioctl
Date: Tue,  1 Apr 2025 21:10:49 +0800
X-OQ-MSGID: <20250401131048.1558811-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <67dad671.050a0220.2ca2c6.0197.GAE@google.com>
References: <67dad671.050a0220.2ca2c6.0197.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/drivers/isdn/mISDN/timerdev.c b/drivers/isdn/mISDN/timerdev.c
index 7cfa8c61dba0..0c3771a5cd0b 100644
--- a/drivers/isdn/mISDN/timerdev.c
+++ b/drivers/isdn/mISDN/timerdev.c
@@ -238,8 +238,13 @@ mISDN_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 			ret = id;
 			break;
 		}
-		if (put_user(id, (int __user *)arg))
+		if (!user_write_access_begin((int __user *)arg, sizeof(int))) {
 			ret = -EFAULT;
+			break;
+		}
+
+		unsafe_put_user(id, (int __user *)arg, Efault);
+		user_write_access_end();
 		break;
 	case IMDELTIMER:
 		if (get_user(id, (int __user *)arg)) {
@@ -255,8 +260,13 @@ mISDN_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
 	default:
 		ret = -EINVAL;
 	}
+out:
 	mutex_unlock(&mISDN_mutex);
 	return ret;
+Efault:
+	user_write_access_end();
+	ret = -EFAULT;
+	goto out;
 }
 
 static const struct file_operations mISDN_fops = {

