Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D408C2DE704;
	Wed,  2 Jul 2025 21:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492573; cv=none; b=GilNpKyVyFZLe2ySvOqA6Kc0yA5JT9p/TGkB+Bp3+czB3WdHeCTocksyZ6YQ/MuazQHPTaAD+283Wrj/Iq+rR5viwoqe+WmHFssHxAiqolXMULLn6TiFgrwVXzVlPYl1ddgJjrcWg2s1jr4vXvggBromNBz1OLfTB9+m62Q5k1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492573; c=relaxed/simple;
	bh=4zGGnzs1fWUDjxO/74byAi0SWfKtXdyJaWa7sLOr6Gk=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=D/+ylw42/N6xiUE6GXGEVvcfIzEIaOA2K1/1IJvgnbl0JGNUaUgra4MIaWSD2GDORxp1GFd3md9B1ZyNg3O3W6N8mTIfAtA3eRSTkFQZ3aN00ktU868ROnslSTpzS+UDbKYPGAF9S3LxoiMgkAqtv0E8zKsWOX66SqHx2prv/Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from webmail.arnaud-lcm.com (localhost [127.0.0.1])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 6719441E35;
	Wed,  2 Jul 2025 21:42:42 +0000 (UTC)
Authentication-Results: Plesk;
        spf=pass (sender IP is 127.0.0.1) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=webmail.arnaud-lcm.com
Received-SPF: pass (Plesk: connection is authenticated)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 02 Jul 2025 22:42:42 +0100
From: contact@arnaud-lcm.com
To: manas18244@iiitd.ac.in
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pete Zaitcev
 <zaitcev@redhat.com>, Paolo Abeni <paolo.abeni@email.it>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@suse.de>, syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com
Subject: Re: [PATCH] usbmon: Fix out-of-bounds read in mon_copy_to_buff
In-Reply-To: <20250703-fix-oob-mon_copy_to_buff-v1-1-1aa7f5723d91@iiitd.ac.in>
References: <20250703-fix-oob-mon_copy_to_buff-v1-1-1aa7f5723d91@iiitd.ac.in>
Message-ID: <32d213c565df4c2a4bdb15b8c5b7c1ba@arnaud-lcm.com>
X-Sender: contact@arnaud-lcm.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <175149256272.11367.274182368719919178@Plesk>
X-PPP-Vhost: arnaud-lcm.com

Hi Manas, I just noticed your patch while I was working on it and we had 
the same idea. I think you are not covering every cases of the issue.
I've done it this way:
 From 49f4d231a1c4407d52fee83e956b1d40b3221e37 Mon Sep 17 00:00:00 2001
 From: Arnaud Lecomte <contact@arnaud-lcm.com>
Date: Wed, 2 Jul 2025 22:39:08 +0100
Subject: [PATCH] usb: mon: Add read length checking in mon_copy_to_buff

Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
---
  drivers/usb/mon/mon_bin.c | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
index c93b43f5bc46..e7b390439743 100644
--- a/drivers/usb/mon/mon_bin.c
+++ b/drivers/usb/mon/mon_bin.c
@@ -249,6 +249,8 @@ static unsigned int mon_copy_to_buff(const struct 
mon_reader_bin *this,
  		 * Copy data and advance pointers.
  		 */
  		buf = this->b_vec[off / CHUNK_SIZE].ptr + off % CHUNK_SIZE;
+		if(strlen(from) < step_len)
+			return -ENOMEM;
  		memcpy(buf, from, step_len);
  		if ((off += step_len) >= this->b_size) off = 0;
  		from += step_len;
-- 
2.43.0


On 2025-07-02 22:27, Manas Gupta via B4 Relay wrote:
> From: Manas Gupta <manas18244@iiitd.ac.in>
> 
> memcpy tries to copy buffer 'from' when it is empty. This leads to
> out-of-bounds crash.
> 
> This checks if the buffer is already empty and throws an appropriate
> error message before bailing out.
> 
> Fixes: 6f23ee1fefdc1 ("USB: add binary API to usbmon")
> Reported-by: syzbot+86b6d7c8bcc66747c505@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=86b6d7c8bcc66747c505
> Signed-off-by: Manas Gupta <manas18244@iiitd.ac.in>
> ---
> I have used printk(KERN_ERR ... to keep things consistent in usbmon.
> dev_err and pr_err are not used anywhere else in usbmon.
> ---
>  drivers/usb/mon/mon_bin.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/mon/mon_bin.c b/drivers/usb/mon/mon_bin.c
> index 
> c93b43f5bc4614ad75568b601c47a1ae51f01fa5..bd945052f6fb821ba814fab96eba5a82e5d161e2 
> 100644
> --- a/drivers/usb/mon/mon_bin.c
> +++ b/drivers/usb/mon/mon_bin.c
> @@ -249,6 +249,11 @@ static unsigned int mon_copy_to_buff(const struct 
> mon_reader_bin *this,
>  		 * Copy data and advance pointers.
>  		 */
>  		buf = this->b_vec[off / CHUNK_SIZE].ptr + off % CHUNK_SIZE;
> +		if (!strlen(from)) {
> +			printk(KERN_ERR TAG
> +			       ": src buffer is empty, cannot copy from it\n");
> +			return -ENOMEM;
> +		}
>  		memcpy(buf, from, step_len);
>  		if ((off += step_len) >= this->b_size) off = 0;
>  		from += step_len;
> 
> ---
> base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
> change-id: 20250703-fix-oob-mon_copy_to_buff-7cfe26e819b9
> 
> Best regards,
