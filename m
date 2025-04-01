Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDAA1F930
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512605; cv=pass; b=cQhU08sy04R8m5MONA3woLPaAXDDtmj5+n7KgL5FQJoWR+HVYEzlmEQKluyKxYXC0uKgfd5UiT1fQ0lwk5uxFQ6q3dyO9XfoQpdahlB6xX8cHxPNRuy9nUXElfGblmALx8AExtzLfFgmdFHbcFiS12JYyXnrPTEODu27H/NC6p4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512605; c=relaxed/simple;
	bh=GCRF7GuO/aQqoLziCQ85KJMW0hL7h7Fg/NrYd5mHvCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gIYfLAbAzgP88c91v3GUjO0faX9ThLQZXSY04Z2jDZaNqctBK+40Kn/12+WMWxrVdRdBsOosmJsDZLkWLlVNS0vrQ/51ighhJ5CRAXAy7vqJG317mbg6gW77EkaFVW8JTBrnuZxVSY07jbJlGGMJJw4xz0B26BTfBFDn2dvMprE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=Zg+4L99x; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Zg+4L99x"
ARC-Seal: i=1; a=rsa-sha256; t=1743512581; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UoHxfQUKAaXSemGjOESKYUCkgP7sqKeJKV+23Lxo4hD3Llsw1U5BBcXO4/+yaqEtaN5mLmB8pXSmrusrRg31MLDAf9a3p8S6C1lhtzxbVoISKpcEuv4RVrJZhrv1lfeepv98feOwpGHvFoaQpzdRhC6nwXgHJv/qs4DwK5K1/3k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743512581; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=relEiKc13eENm52bRCs3RiJ+RXj5koRdZHU3Otk5FDQ=; 
	b=IYFROvcScw/GcjlksmR2gRvKpBzIy0fg/wwrLMUuSUXuywaVAV1cuZc4Z4FKx8Ue6bMmqBAFCxwM4jbRizo5uwbZu1W89BARMCnAv9zN+0k5iIlQkPPSUObzs/MOYaHZnntCdzix5YLh657CAoBRCb14YDmjDMCjl4r4A3TEevk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743512581;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=relEiKc13eENm52bRCs3RiJ+RXj5koRdZHU3Otk5FDQ=;
	b=Zg+4L99xL+98wtsN/9QbnB2mYv7we1ANT7IZeJtxCi8myVoqLpJS4LqXRRjJy864
	mH5qttZrKMr+LTd4HlozjbXtuZ2WjkcObIBDc5z2EJ4Eu/t/N+YMJZtb9/3fSF+74rb
	BkssLS+aBVxP7uj1P8f86zAsIuJ4XVejWpcbnPRo=
Received: by mx.zohomail.com with SMTPS id 1743512580399914.8049633205814;
	Tue, 1 Apr 2025 06:03:00 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1] MAINTAINERS: Add Dmitry Osipenko as drm/virtio co-maintainer
Date: Tue,  1 Apr 2025 16:01:51 +0300
Message-ID: <20250401130151.2238772-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

I was helping to co-maintain VirtIO-GPU driver in drm-misc with
permission from Gerd Hoffmann for past 2 years and would like to
receive new patches directly into my inbox. Add myself as co-maintainer.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 24e4d90a38d1..048dcf2a3675 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25153,6 +25153,7 @@ F:	include/uapi/linux/virtio_gpio.h
 VIRTIO GPU DRIVER
 M:	David Airlie <airlied@redhat.com>
 M:	Gerd Hoffmann <kraxel@redhat.com>
+M:	Dmitry Osipenko <dmitry.osipenko@collabora.com>
 R:	Gurchetan Singh <gurchetansingh@chromium.org>
 R:	Chia-I Wu <olvaffe@gmail.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.49.0

