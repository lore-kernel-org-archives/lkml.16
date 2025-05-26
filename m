Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFC01DB546
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748250115; cv=none; b=huup0FTlpgvFGCXeV0aJMQF5ub55cWXXrCxx9zQym9OkqHTnQ4N18RXst16rrOrWz08KltFX5xEZmHmqcJPDbJT/tkBv9o3wWPyjaunKddKfsODEBHE5er5EtiC/n5qKrabeLc/+WPXMAWA6Z+ZXCU7rD27TYhSKWDB6LgYJRpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748250115; c=relaxed/simple;
	bh=nmXboQQCUu01/xiEDjIBc+fgApQJh0IAbcu4AwvDqfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mphrg3HXDrVX4tYIaFbWgpUTRi9QSfk8vGOVlRh2ihUaHemX1A9LAjNbbIodNKDuO3csyWulyMBy9MR8NXiOkijoTbxhfrJOu/A3wrgqQ3pOQbtazKTunYftmHmwZD0fDj4+1zGxxcNTEGiKt9UCznppB4Wmav3opWt/tMGzZw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iyVr5SJO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iyVr5SJO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748250113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XpqFq1Cn/q29H6M8GbCwazfqpbC4oULqm059siADfdQ=;
	b=iyVr5SJOd6PvKN7lka0JZp0GCp2wUxcOheV5kcHN/LYFNi0XbWdKlkGEVzwiWvaXqyKgtL
	zNP+QPjERv7XNVjc/YZ2zQFKh6bGzfKwC7JSQ1NHwADTkaBV8QHQoUNKYDboDTd4GnFDRn
	vpmQ8ROLD7iVK8GHMcEFJ9hKVKTf6Zo=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-DyB7aqmBOGmFizkN7_eEvA-1; Mon, 26 May 2025 05:01:50 -0400
X-MC-Unique: DyB7aqmBOGmFizkN7_eEvA-1
X-Mimecast-MFC-AGG-ID: DyB7aqmBOGmFizkN7_eEvA_1748250110
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7429fc0bfc8so2450371b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748250109; x=1748854909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XpqFq1Cn/q29H6M8GbCwazfqpbC4oULqm059siADfdQ=;
        b=ctVBCPhFzSytHpn2IhqmiwsKJdg4pgltEa9BlXsxDNev+P/QgEOM6Uw6f7QbG4Kg8a
         bpq3lVdMtTRRUJ5RyotISWfGLcoIn460umDhERDMo3KCeb5VfZNjemM0PxihItUfSw02
         zWt1QKRJJcxadBBYXGoLGq3RkTPUCCb9jq94JzxVMyLGPWj+IW6DYJQMwRc9rW4dgr3d
         NmYMZ+jAxNW4t3a6nRB2NF1npxxxDMf5gXFQ/JWwssvo/sk9rrA5lpxgy+e7Kbq3YLHk
         WMUOnK5EIar9xQoixMjBm9miR0FnhpkjTuGNrI8tT6lC8ntjMuzMPwHmRurfQF9R5Who
         Orcw==
X-Forwarded-Encrypted: i=1; AJvYcCXcicTWbcPrjHe7a/Z/CV8v1PCo44UN4Q1y+DCnAJOey02YV8+MuquJMa/H+CRG87VD2xCdKbJC1mmU39Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYvf4o4N4+AYR4ugfRHi7OZi3jScKThWfr3b1ClM6kD+KXVPPW
	UHdZMbzXNer4NCGE/rvwKCZ9vMV+ppjRAMZzMKwvTBKrmdSlCks2nT4EmbxU9dYN2b+yj9aLxkw
	vNG2syDk/dhSxH7Qp8yQuw80ZkhCWJtxmlhvSxg76tHb0U9k1ZAO5onbFk50A6Blv7A==
X-Gm-Gg: ASbGnctgCcbBr1aUxUTihKECBxA4qknN9pBZSwkNjYPkOq/lbga9b1v1mepEkehKvVY
	DAwvLl9muunZj1CY7OXkLGW6UbMayT9ELbL9brBMXuuYN9Jao1CUD2DyXw5zDuCJB5S25Z4m5KC
	/N99HsVxwatAnWwPOvYOHv067xFflL2kE+OByfzfF39JOlVIl4PqoC6kNU0l1gyiZLZ2qORrpsV
	5BfnJnAXG5hLYH6LPwk2kpTwYQYL2R3u589Gn0+I8wBjEOaDRlO7uw1wsEbmTDQ/BR16AsD0iLg
	LZq9Uj4BiLt6
X-Received: by 2002:a05:6a21:3390:b0:1f5:8cf7:de4b with SMTP id adf61e73a8af0-2188b6edb8amr12702091637.16.1748250109596;
        Mon, 26 May 2025 02:01:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg0OYyfVBPgdKD2DLb50UwcWBJCWgjQ/A2N0sS7L7e5vajyw7pe8MKb0ud18NgI98tWZxDgQ==
X-Received: by 2002:a05:6a21:3390:b0:1f5:8cf7:de4b with SMTP id adf61e73a8af0-2188b6edb8amr12702050637.16.1748250109169;
        Mon, 26 May 2025 02:01:49 -0700 (PDT)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9878b53sm16575092b3a.152.2025.05.26.02.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:01:48 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: drawat.floss@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH RFC drm-misc-next v2 0/1] Add support for drm_panic
Date: Mon, 26 May 2025 18:01:04 +0900
Message-ID: <20250526090117.80593-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds drm_panic support for hyperv-drm driver. This function
works but it's still needed to brush up. Let me hear your opinions.

Once kernel panic occurs we expect to see a panic screen. However, to
see the screen, I need to close/re-open the graphic console client
window. As the panic screen shows correctly in the small preview
window in Hyper-V manager and debugfs API for drm_panic works correctly,
I think kernel needs to send signal to Hyper-V host that the console
client refreshes, but I have no idea what kind of signal is needed.

This patch is tested on Hyper-V 2022.

v2:
- Re-write codes with regular atomic helper. The driver was implemented
  with simple KMS. So replace it with regular atomic helper in [1],
  implement this feature on it.

[1] https://lore.kernel.org/all/20250427101825.812766-1-ryasuoka@redhat.com/

v1:
https://lore.kernel.org/lkml/20250402084351.1545536-1-ryasuoka@redhat.com/

Ryosuke Yasuoka (1):
  drm/hyperv: Add support for drm_panic

 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 36 +++++++++++++++++++++
 1 file changed, 36 insertions(+)


base-commit: c06cb85ad1412c6ff34792b028b2f89495761398
-- 
2.49.0

