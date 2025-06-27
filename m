Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9959E243399
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028394; cv=none; b=AzG60i8I7b0W5oTP+gNVlLiuSDR/+NB+5m4a1/x8CYUEjgJd36GInSZbF45FD6S1MlDWz5MoiFQHEj0d2vGPU88pJqoUUs+iLrHbsg2rgw0FC0MKSEPvjoTSWl6e2ByacVZi+dsDuXKlw+En4QMd4egwWKa2yzLh4l3GiEGk3vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028394; c=relaxed/simple;
	bh=DOyrnqJ6ATcp18/dk9EAAwqjWkFeX+WDSIW43p1hyrs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=txRjVHRatXcgkZEANR5MKDpfppiPoTJb05i4IapqX30Rvxwkl1sHafe+ZxRt3XDplKJq4+7zeTUbvbEW5xHviZT1cdzprXpX43H7spW1KvJ/P1vGNtosqaTymyCSUy2J/INyGF3uC5Ztaro7sqhS0M76t66TGVKFS3aR2i20H6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I0Nd8Xoy; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I0Nd8Xoy"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4e9a284c225so575202137.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751028391; x=1751633191; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Mdop9uKkWlZPGtBxO/wICJeVJXqBGyd03pBu5mrmeeY=;
        b=I0Nd8Xoy5Enj2ZOPvTG59klC9AhiNdY2Ywpnrensc40mtSjWyv5BY+BybG2K6pUoqB
         v9xQoYnF8Tb+1kjCQqebWvH8KzN9FlF7e/La9n7inL2RK+YUjWqAaQZdBULsEUTrAiKr
         XKkIiPQK9/GKzRrorDZyXIEIgzsBAf6UlzzwqaXRRY8ibJYlPtE8i+P2DJMYiUF+SIdU
         GjRz2jhujeQyDqppY4XZESIxKq8zlO8ieGk/tqEaWKu1ke7L/Z4d3AioMQEQNHda1Yt/
         oRNVqqUA3rhYOIod/UOtdsNzot21lIBz+7D5N5jSI9dJ89FEd6pfyvDvddXDzCiBkDdB
         pAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751028391; x=1751633191;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mdop9uKkWlZPGtBxO/wICJeVJXqBGyd03pBu5mrmeeY=;
        b=PBJO9ToQSwVGeFyUgN202JOZq4aoqwXNVWWE00CPYEwWabCaPuDJea8fJZoWrF5tpB
         y1n8NwEH8zaZSK4pzeNri6pPkyJKTrVF4LbCPzeYmX4eozLi9PF23pgT+WSipcmmkrYw
         UrYSV5xeQZPbkxrVWzq0tUwCcTstqXPMqB9LKyFzLTvLhSYjlZMR/1pH57ZtZSpPSDiM
         z+Yhk1vRK54aC3E7izXoXDBVKbsrOFfGQNkTKqepgxXg35okUrtB5f1Gw5aW1d0P1Qfv
         X0pe/zFDgcoslDbGDGOyt/foUi0A4Zy8vWmIYdCs/SJCHvhQciQ4zpWqkUh4iaopDeZW
         cfNw==
X-Gm-Message-State: AOJu0YzBC3e2JJAk9z2YjN1zD51J4H8hJAx6hfYIZivWoonJt0sGK8/j
	iGEN5Ue93SKRk+vaoX3oAvlbl8o1Pe9yv9h9/me8KcdfdRNV739XTcHlYxfR8UE1SI1fwPuw0Zn
	dpYTl43b20YrYpVr8cu8mfhSnvjinn2rbZL06ymg=
X-Gm-Gg: ASbGnct3VRLBmHiiDiNtCXbAm5jzfyfVPkKfzopX+5kfJ7+TRmDMhOQC4wPQVwhrQKV
	V3PK+kjDzlRfmHFmMz4kyO6Fd9ffCOkH35HzlgstZWdnAFBK+722aXLieTa1t9d/Zr9YLYj3ZXJ
	9kHKRFpalZ0p+OJoVTxKV5ooavfQbZeuLCeADQL+sRcgbWBkOfa4bS+6GLCjSoy8jFhxv7+Eufn
	fT6
X-Google-Smtp-Source: AGHT+IG4FIK119VTnYd2jajzuLkcFcE/YJxuC++3ZapcdDcRAcWdQYvOeEcsVvk8CXksMH+NyWXiEoBy0cKdixH6MWI=
X-Received: by 2002:a05:6102:3e17:b0:4e9:924f:eea2 with SMTP id
 ada2fe7eead31-4ee4f4847c7mr2072911137.4.1751028391404; Fri, 27 Jun 2025
 05:46:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: ritu pal <ritupal888@gmail.com>
Date: Fri, 27 Jun 2025 18:16:19 +0530
X-Gm-Features: Ac12FXwO6n-DKG3txokXMs3JJhVpee3RTX4l7yZ1Rj4cGtjS3Q_tmpaIM0xUdz8
Message-ID: <CAEy91+YmfCeA6Y29Bf2Cunk5L3Wrif=1tRFxBOc6iPO6JEtBpw@mail.gmail.com>
Subject: ipc/mqueue: release spinlock before freeing node_cache in mqueue_evict_inode()
To: linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Ritu Pal <ritupal888@gmail.com>, 
	NeilBrown <neil@brown.name>, Chen Ni <nichen@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"

Currently, mqueue_evict_inode() holds info->lock while freeing info->node_cache
with kfree(). Although kfree() does not sleep, it may take a non-trivial amount
of time, increasing the duration the spinlock is held and potentially impacting
concurrency.

This change moves the kfree(info->node_cache) call outside the critical section,
releasing the spinlock before freeing memory. This reduces lock contention and
follows kernel best practices of minimising the time spent holding spinlocks,
especially around potentially slow operations.

No functional change intended.
Signed-off-by: Ritu Pal <ritupal888@gmail.com>
---
 ipc/mqueue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index 82ed2d3c9846..897caf55e217 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -526,8 +526,8 @@ static void mqueue_evict_inode(struct inode *inode)
  spin_lock(&info->lock);
  while ((msg = msg_get(info)) != NULL)
  list_add_tail(&msg->m_list, &tmp_msg);
- kfree(info->node_cache);
  spin_unlock(&info->lock);
+ kfree(info->node_cache);

  list_for_each_entry_safe(msg, nmsg, &tmp_msg, m_list) {
  list_del(&msg->m_list);
--
2.39.5 (Apple Git-154)
