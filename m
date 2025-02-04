Received: from mail-vs1-f74.google.com (mail-vs1-f74.google.com [209.85.217.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AB317F7
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738627269; cv=none; b=cLKhNd8+4lVItvMOpXZvaGHESUvUpN70XNhdgw/mc4rHI/WqsS77MladBCFHOb+6kAeHPfUpsBjc1Xs/LxlQXqz2WsSjmM6S0JKbvonzvTA66StJgw/VZwFq135eM44/6IL4JZSTuVYV8/PhnNBumyAImjmicEvW3KY3ohzOPp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738627269; c=relaxed/simple;
	bh=ff8sQkJWTl2JSMgbPndRNr5+dCrOQHKJ4z/HtRI/rb8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=IQt4Za+jAWQEk50RUTfbaL499o68bxOLIss08wwTx+mGRqgCXtmDLoFKVUej57w77cM1n2cQi73Lj4ld6Mnpzros23TcGcShkKH6NWuvQrYJzUUoNK/3f7j8V+CgQsKeIuqjb90Ent4TBtYdu+Npc8h/udXtwB/HAF/rPy1lrYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nG0wC5pQ; arc=none smtp.client-ip=209.85.217.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--royluo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nG0wC5pQ"
Received: by mail-vs1-f74.google.com with SMTP id ada2fe7eead31-4b3cc537766so509735137.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 16:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738627266; x=1739232066; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=em5AizfvgfoSk/7IpVvE0FGzS3dPFqDA9+Q7W+ZArzY=;
        b=nG0wC5pQQuDvk3SJdeeEg2XdqbqM8bigpFbsvDB+Nd83QfeiNjkhCnTuxYDjkGjtjs
         i2vW57UlcircRpadYK8sFPMGtw7G7iyIHCjF3rLJ4yGs4mJdarmv8W2zMELsSda0R5Jq
         QmXx7bL1Ggmfy9DjfU7u5ldn/98M1X0whjRnGm10vPf637K3O8ynwseKxIkGvr+WshUF
         uuh8bWnuwcrvSdzkqq0b53xvgtl05qqc6PZkpoacRbX86ouoloxmaBlYy1F4Qunh8JRl
         m/hjhMm1Vncocdb+7eegHzpyD9jAdqJkU9S5uqpqkEK2rUibyemwsqJVOxV99STe6nBN
         a8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738627266; x=1739232066;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=em5AizfvgfoSk/7IpVvE0FGzS3dPFqDA9+Q7W+ZArzY=;
        b=qjvG0Qp86SgJx0CP38kHjX6rhlBGktZpoKBqOz3mKWZC5YSyAJoPxoDpv70A0pq5tX
         ZNBHobUFBblfN1CFzqVv1n9sHoQ3nuvdGcGFmMT/QPcitrGvsNP85g157isBHTJzZnFR
         IAP3mhH+dTcpDc8C9ziS3PbblxG0c0ZpOO9H+nuqMnpmIAQQxMz9q4Ub3VFjU5eQk8ai
         CcUqW4F6rxCdYTk5Als8itis841wkaOCcq5jQXe4dcZeayDZaYu5wzVtyyghOqHxNttl
         TxSc9tE9CNnt9NOrdZDhDLslBCqVp33chebJI6h1vs0WfuolT5SMQd/d2Fzd2F8hQ3aR
         E/eA==
X-Forwarded-Encrypted: i=1; AJvYcCXkxr2AAcx0NFdSTUEepFJJkT0bbLtIhh6H/HYfVuhDE0Q1Dx29BJIpxCIPm+cYvZY3MNF0R6VPLgLmOyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzptielGRECR9moSMi25MplTkeh+qy6wwLZXcYv+ZzRCZ8Omze
	EPnaf+kTwQpFOBPID10yONoHzi7MSmS7wH3Ia8DjNPiwVKIKRdSJ91U30WBioTCYpFRlqLf4GpX
	VDQ==
X-Google-Smtp-Source: AGHT+IHIOngP72sVGL2qIXaFFJGsq1inwYzgOoTmPQKWYL3v02tNlviZN6iQtCHrbLQVquoZ0I5+7WkKGUA=
X-Received: from uamz12.prod.google.com ([2002:ab0:22cc:0:b0:866:d46b:310d])
 (user=royluo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6102:3596:b0:4b2:bceb:1ac6
 with SMTP id ada2fe7eead31-4b9a5231b4bmr18260823137.17.1738627266246; Mon, 03
 Feb 2025 16:01:06 -0800 (PST)
Date: Tue,  4 Feb 2025 00:01:02 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250204000102.3989779-1-royluo@google.com>
Subject: [PATCH v1] usb: gadget: core: flush gadget workqueue after device removal
From: Roy Luo <royluo@google.com>
To: royluo@google.com, Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andre.draszik@linaro.org, elder@kernel.org, stern@rowland.harvard.edu, 
	crwulff@gmail.com, paul@crapouillou.net, jkeeping@inmusicbrands.com, 
	yuanlinyu@hihonor.com
Content-Type: text/plain; charset="UTF-8"

usb_del_gadget() can lead to new work being scheduled in gadget->work
workqueue. This is observed, for example, with the dwc3 driver with the
following call stack:
  device_del()
    gadget_unbind_driver()
      usb_gadget_disconnect_locked()
        dwc3_gadget_pullup()
	  dwc3_gadget_soft_disconnect()
	    usb_gadget_set_state()
	      schedule_work(&gadget->work)

Move flush_work() after device_del() to ensure the workqueue is cleaned
up.

Fixes: 1ff24d40b3c3 ("usb: dwc3: gadget: Fix incorrect UDC state after manual deconfiguration")
Signed-off-by: Roy Luo <royluo@google.com>
---
 drivers/usb/gadget/udc/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
index a6f46364be65..4b3d5075621a 100644
--- a/drivers/usb/gadget/udc/core.c
+++ b/drivers/usb/gadget/udc/core.c
@@ -1543,8 +1543,8 @@ void usb_del_gadget(struct usb_gadget *gadget)
 
 	kobject_uevent(&udc->dev.kobj, KOBJ_REMOVE);
 	sysfs_remove_link(&udc->dev.kobj, "gadget");
-	flush_work(&gadget->work);
 	device_del(&gadget->dev);
+	flush_work(&gadget->work);
 	ida_free(&gadget_id_numbers, gadget->id_number);
 	cancel_work_sync(&udc->vbus_work);
 	device_unregister(&udc->dev);

base-commit: f286757b644c226b6b31779da95a4fa7ab245ef5
-- 
2.48.1.362.g079036d154-goog

