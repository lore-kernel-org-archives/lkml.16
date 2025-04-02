Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64490170A13
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743616035; cv=none; b=g9kV4zSbLWOj24w+/4VNFd2XgU5GIV9Oupm30kHJRpcLbuNiwEIRFxBO9OPoR7iDDbLh1K74lBK12htv+72uVDedQAgavgHusSF2HGC7dmLm6fNjdHSn+6fLSSvqNmKNNs2sMIZD5QvcmEN/oaYo92oE5oHMBM/l5B9FATUcWiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743616035; c=relaxed/simple;
	bh=DaC4xIu8S920LD9rwCqJXW5v8vFKT9MSwvYIoasRtA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ONZfUW7yA6Sfwzf6lO8GkhD55bY9+EZXLDYnSd7gxD56KiJx5QkaBaE3+L90Ry011hCdvpPbYP9B1/pgqq9+mlXO4guEI0M5GWgprlfQRqvy0ep15Bq8lEiAOumo8nvevaBPlHCNQ6WyK+wnkoWvnFbidVRM/2YgUTvRmWO8vr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K64Walcm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K64Walcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743616032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ue9UDRpcZFfRT6ZZ3d1v/ptuQfesmwypehS6C96747U=;
	b=K64WalcmOYg5l/C5+o4Cdfc1KxfFthfq7JkxR60vu0Oc0De0imlDfLU/7YruUgkDFBiJiG
	IKPnKZb4PO2XFSFRl/m70YuoqV1N6CGXSvxEzzT0SO8x4pj3rz2eoKLK4mRBmy4IuGlhXq
	m/Is/YT+6wwjEvjNGLV43zytCb8RBHU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-kw_GrFiVMlSP8i_dIaLUnA-1; Wed,
 02 Apr 2025 13:46:45 -0400
X-MC-Unique: kw_GrFiVMlSP8i_dIaLUnA-1
X-Mimecast-MFC-AGG-ID: kw_GrFiVMlSP8i_dIaLUnA_1743616003
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2ECDF19560B3;
	Wed,  2 Apr 2025 17:46:43 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.44.32.79])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5EA6C180174E;
	Wed,  2 Apr 2025 17:46:36 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
Date: Wed, 02 Apr 2025 19:46:01 +0200
Subject: [PATCH v2 2/2] drm/virtio: add VIRTGPU_PARAM_HOST_PAGE_SIZE to
 params
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-virtio-gpu-host-page-size-v2-2-0afdc8c16cb9@redhat.com>
References: <20250402-virtio-gpu-host-page-size-v2-0-0afdc8c16cb9@redhat.com>
In-Reply-To: <20250402-virtio-gpu-host-page-size-v2-0-0afdc8c16cb9@redhat.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Rob Clark <robdclark@gmail.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Sergio Lopez <slp@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770; i=slp@redhat.com;
 h=from:subject:message-id; bh=DaC4xIu8S920LD9rwCqJXW5v8vFKT9MSwvYIoasRtA8=;
 b=owEBbQKS/ZANAwAIAfRpJ40vDAI1AcsmYgBn7Xftkj6yT9EYp57Tc7Bmv1zyoPKTdeDBQ7qkl
 d5Bd7CqT4+JAjMEAAEIAB0WIQS+1fz3US2GgJFC6KL0aSeNLwwCNQUCZ+137QAKCRD0aSeNLwwC
 NRArD/0f+7eo5bUxWQvbJN9KrMRdB2fyPQ13i4nJAfYT2e5NlYqIOhBo+y/gR947CahgRByLNV8
 jx8rTk7ec5IxbSV91+/+vY0HdH7yYPCfZv9cqTikzbYNU/vKRPJnoz3yLjJy/DxOFKIl5VmUzZu
 lCGqhAcV5pUkDcOZIGasG8w3Ep4yKTb5nHFMbtVr9Wf1lijRwgFwVZ5IqcLQ3LlSwzQID1WaNn0
 N0bXN0mpScF2yetVddZSZWm/1mdUyaYpa6xT2NTy9kSEZlSNL9lyTp26q0yngn/O5OZ44t1KVdj
 KpuRWNbdQZePkyV2yO8fgRRxFYr4yWzIyhnul27ocIi8cUIIV8TjLGhro930WzpXpW+MpH9Edv1
 sFkdhGn1Az2kHAqVrvucxuZGc3MUIx81KQKXOQLGIUrDkKjdN+iQxdlu1vUKP3FoSQnVLwxxZae
 HwcbB1dO4Wh2FjClL6uGFKWjtT/X1PUAq64opjQxpMzeovGquNOPdjzr0yeWnOpICLrXGaCZrsf
 hkqcoKur8y7PKCIHiynf/TEONEmBpkv+MG6MAdohfF0l38IM6ALTOykqyizM3Fk/iLqMQK+9IZd
 bKWy/z1Raq7iOS3z42kPCMv5aDJvCibrOSat/d25u4ZIKy6upBMx2qjqxOqhHlJBOeJHa13i/tA
 5FpFGFmlEcviBYQ==
X-Developer-Key: i=slp@redhat.com; a=openpgp;
 fpr=BED5FCF7512D86809142E8A2F469278D2F0C0235
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Add VIRTGPU_PARAM_HOST_PAGE_SIZE as a param that can be read with
VIRTGPU_GETPARAM by userspace applications running in the guest to
obtain the host's page size and find out the right alignment to be used
in shared memory allocations.

Signed-off-by: Sergio Lopez <slp@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 5 +++++
 include/uapi/drm/virtgpu_drm.h         | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index c33c057365f85a2ace536f91655c903036827312..405203b3c3847a8b318a7118aa34356c839d249e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -117,6 +117,11 @@ static int virtio_gpu_getparam_ioctl(struct drm_device *dev, void *data,
 	case VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME:
 		value = vgdev->has_context_init ? 1 : 0;
 		break;
+	case VIRTGPU_PARAM_HOST_PAGE_SIZE:
+		if (!vgdev->has_host_page_size)
+			return -EINVAL;
+		value = vgdev->host_page_size;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index c2ce71987e9bb816d13a300679336cb756f1cbcf..505f87263a15f55302d7134335bebd91ff4cdae3 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -98,6 +98,7 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
 #define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capability set ids */
 #define VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME 8 /* Ability to set debug name from userspace */
+#define VIRTGPU_PARAM_HOST_PAGE_SIZE 9 /* Host's page size */
 
 struct drm_virtgpu_getparam {
 	__u64 param;

-- 
2.48.1

