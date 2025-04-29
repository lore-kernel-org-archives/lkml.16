Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291D3270544
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906820; cv=none; b=CYC7994sm91YuLcsCcB9VfBuZpy+TbKMzb3CHGiwgDVwmbd/TKmtC12IP6IXDYNIsJv6MX/uPO93u+E71LJ89SR2YRkEvew4ebp6usmLBu8achzGtveqnMQtVtK+GXdLaN1TEuNYf3mCRrbd1eUBKlllKgPJrE9IOIMOxNVk1sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906820; c=relaxed/simple;
	bh=h3NVd7fi8Ig0HXWeKv64dSUCt4La4mqyBSftd/H+nNg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LIZ0ZhhU5L1WcxY9DUzUHdJ8En7i+xi8S4vmC22VTAOH9IuLaRUe57LnJ/hpGqADes1Y95LrVs1NTl7swrYghRCtSPk2SCxXX8Mv/eunHHJI/lSSoVsKUHp2Tt+QnnrXtM3zlxHkTo0vGVyAgbZvtVnCuvTLvZD2h3/VEluRCmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMehnZR7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMehnZR7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqE22006738
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zMMsCZN8LQ3t7/Q7EfRJ4k
	BvhvXv0NewE2HNWY5NzV0=; b=KMehnZR7Xct1O98Ld9O61zlRt+HHWYJTTJ9Fem
	sBgt3R/JXpRafTSXPYNpT9xpJIBEqR6CI5I3oQZgkK1iG2vqOnwmAMan6SLQtWEi
	g5Ywju+ea02N8Zzv/E6Dn2isKY9OlLy7fWR2DzDZmrUhTw+KZWKXtDPyvZWUzrHd
	j4qHmwTZXZs1WJEYB0ejGDB7hTS5JAdUV4z0Z9hPQjWPD/d5irqdyNSAm/8irDz+
	J+gOpC+5oSP1gLAPgXCCNQO30/0DZIPzkLZYeYwzPT14NfRZxR2CjTADYhn2Igi6
	H6iL2ItY154cMXnRiaTjes+kaO+8wmbvMcI3pPbJIcNdtkdA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmkdth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:06:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7394772635dso3769214b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906815; x=1746511615;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zMMsCZN8LQ3t7/Q7EfRJ4kBvhvXv0NewE2HNWY5NzV0=;
        b=YB4vJLxob9DSrL8lZvQH+OC67qTHHHbsjkHDzTcqYxHfZclmR0Ji4sQLfFkISP0tZV
         n6FnwHnw6iyPfnS66FgRnmOWVTWOI1C/Z6vzcRxLU5bfKg//iAEBSjalwhN1hCvsdIxi
         EMbzAVnntlHfzHb94+pHl2nAVE5yYrkybeTrFSYb4Xd+147Oj8Zk5iXscRHOBgYEcNAb
         1a1nhFcBivMJatpeJ85BvFuWZYVUPNeSAgzsJielL2E8fePTh1HkUbI5IKhZJHHAqZXJ
         Lf/RN9xADAnZBeY1Be/CcInEqW2U5EhRQM77I3Pznuq8mCAuCnx99ahssaYegXdQxivm
         Ct8w==
X-Forwarded-Encrypted: i=1; AJvYcCXBAQNyIOuigOEksZdPPw9W7SCbexzbFW0SOqweLuJKYK8G0vkKSqdiAbw+8GpeBGeL/iyCgxmaxWFAxLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWEqVtIztX8PJU7o2UmOQQKKbS0UQbckiGgTGVMJsIyRjjp+fV
	NKjZl4N9TmdnZkTIVVBfVbi9oQ/6zzFbPfEPFbHvxcpk3HSE/XPAnGSRlIXFiZdpwncH3w/7hSZ
	0IvqCAbW3uPfoOABuFGW63mnrGAQxo8xbWrqMy/il8ZECL2nuNzmoQWgq/jN0mA==
X-Gm-Gg: ASbGncvGUC1B13mFhdOb8xDgp52T0hddLUf4YgSlnVrLhdbspKZTlnLhSJHtSAmHU7C
	YZtrziB7Rssks4x0snbRtWa2bI22zEd+MdQFExs6cEzkuAYNwibPUp+x4ZxHKrzMyHUwS7L5ZdK
	AM4+vKI6MgCdkJks5Nt7+1anyROhRd2D4UgudaCGwcbln+4ZXJHPoPNUQpD4RH81YeZHBLxOo7V
	N/I7yv3ayk767phn3t/AT63ehlGAeMb1iQJQJ0Eo1xpzr9+GbMDzGruSRLjlwIAXluodwZJahJQ
	IeJ7xm6cUY3pi4+b5ksmJX/b0ceNG7ltUw6LGBkP44u3I+uFejvYaFWwrzIKLt5hd3x2qvM=
X-Received: by 2002:a05:6a00:a28:b0:736:5725:59b4 with SMTP id d2e1a72fcca58-73ff7255d50mr16226205b3a.3.1745906815167;
        Mon, 28 Apr 2025 23:06:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuXLjbPivePMa3SRH1zyQCTTvNXe5AVPLmb03PDJa/O/Y1wyCDPC/W8/0MtYyIjWaGw+TwPg==
X-Received: by 2002:a05:6a00:a28:b0:736:5725:59b4 with SMTP id d2e1a72fcca58-73ff7255d50mr16226169b3a.3.1745906814704;
        Mon, 28 Apr 2025 23:06:54 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:06:54 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [PATCH v4 00/11] Trusted Execution Environment (TEE) driver for
 Qualcomm TEE (QTEE)
Date: Mon, 28 Apr 2025 23:06:21 -0700
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1sEGgC/5XNwW7CMAwG4FdBOc8ocdJm48R7IA4ldaintaFNW
 zahvjum07TDLuxi+Y/i77+pTANTVrvNTQ00c+bUSXAvGxWaqjsTcC1ZoUZnZEAfUgsjEUyZu/O
 65QxXHps0jdBSC+n0DrbEUJbW6QK9EusyUOTPtedwlNxwHtPwtdbO5vH634bZgIZYaKSoDWlT7
 vuJA3dhK+fq0THjjyu/nndRXHzzVIVa19bFv679dS36Z10rro+u8NpbfMV6n3Le9lP1IeftN74
 syx02MO6RkQEAAA==
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: xhPsy1116zs7m9P5sQ2agEBEZbBGFaco
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfX8beLiCRDn+8j fSYxuZtLUq+4+J6lEQk1sOcBUGCvtGyKh9wResq60GHO1xhOIhqrAiDWGfAHWII54HCOexHbWTq NtpLMLPHFljd+VUEjlhKKHiBfYAClxLYg9f+befHiby/aXW0/2nHluYAOVtgPZs1xE9c7L/Cm9t
 wWG7XcNVk5KVZctgTcUbS77lH8caqUQ8jENRNJAPpqwCtJVByE2ynU4x5E8jIRgxQ7Om7zjk5ng rWR3Mprb2Xa7qdNGq21rO3gZzxR4x3AADGy9vs9r2LvVKUJmC6g2OFMp3kGCemObcuxeHQDXc0x /0ws1/oNklhTd1d03t7UDVbjOf+zOvHREDXNIG29J3rEPuTOIOjfcK9Mg32odCAVy32tZbaXvrG
 771kQE3R3OTjgp5YhrTG3rvb0fUI+TNaI5EkclBFubrVxewucodoWvniTNfzG/1jDHXoSSln
X-Proofpoint-GUID: xhPsy1116zs7m9P5sQ2agEBEZbBGFaco
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=68106c80 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=CT4NIRYFaVtSUlOmZkwA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290044

This patch series introduces a Trusted Execution Environment (TEE)
driver for Qualcomm TEE (QTEE). QTEE enables Trusted Applications (TAs)
and services to run securely. It uses an object-based interface, where
each service is an object with sets of operations. Clients can invoke
these operations on objects, which can generate results, including other
objects. For example, an object can load a TA and return another object
that represents the loaded TA, allowing access to its services.

Kernel and userspace services are also available to QTEE through a
similar approach. QTEE makes callback requests that are converted into
object invocations. These objects can represent services within the
kernel or userspace process.

Note: This patch series focuses on QTEE objects and userspace services.

Linux already provides a TEE subsystem, which is described in [1]. The
tee subsystem provides a generic ioctl interface, TEE_IOC_INVOKE, which
can be used by userspace to talk to a TEE backend driver. We extend the
Linux TEE subsystem to understand object parameters and an ioctl call so
client can invoke objects in QTEE:

  - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
  - TEE_IOC_OBJECT_INVOKE

The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
used for invoking services in the userspace process by QTEE.

The TEE backend driver uses the QTEE Transport Message to communicate
with QTEE. Interactions through the object INVOKE interface are
translated into QTEE messages. Likewise, object invocations from QTEE
for userspace objects are converted into SEND/RECV ioctl calls to
supplicants.

The details of QTEE Transport Message to communicate with QTEE is
available in [PATCH 11/11] Documentation: tee: Add Qualcomm TEE driver.

You can run basic tests with following steps:
git clone https://github.com/quic/quic-teec.git
cd quic-teec
mkdir build
cmake .. -DCMAKE_TOOLCHAIN_FILE=CMakeToolchain.txt -DBUILD_UNITTEST=ON

https://github.com/quic/quic-teec/blob/main/README.md lists dependencies
needed to build the above.

This series has been tested for basic QTEE object invocations and
callback requests, including loading a TA and requesting services form
the TA.

Tested platforms: sm8650-mtp

[1] https://www.kernel.org/doc/Documentation/tee.txt

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

Changes in v4:
- Move teedev_ctx_get/put and tee_device_get/put to tee_core.h.
- Rename object to id in struct tee_ioctl_object_invoke_arg.
- Replace spinlock with mutex for qtee_objects_idr.
- Move qcomtee_object_get to qcomtee_user/memobj_param_to_object.
- More code cleanup following the comments.
- Cleanup documentations.
- Update MAINTAINERS file.
- Link to v3: https://lore.kernel.org/r/20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com

Changes in v3:
- Export shm_bridge create/delete APIs.
- Enable support for QTEE memory objects.
- Update the memory management code to use the TEE subsystem for all
  allocations using the pool.
- Move all driver states into the driver's main service struct.
- Add more documentations.
- Link to v2: https://lore.kernel.org/r/20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-0-297eacd0d34f@quicinc.com

Changes in v2:
- Clean up commit messages and comments.
- Use better names such as ubuf instead of membuf or QCOMTEE prefix
  instead of QCOM_TEE, or names that are more consistent with other
  TEE-backend drivers such as qcomtee_context_data instead of
  qcom_tee_context.
- Drop the DTS patch and instantiate the device from the scm driver.
- Use a single structure for all driver's internal states.
- Drop srcu primitives and use the existing mutex for synchronization
  between the supplicant and QTEE.
- Directly use tee_context to track the lifetime of qcomtee_context_data.
- Add close_context() to be called when the user closes the tee_context.
- Link to v1: https://lore.kernel.org/r/20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com

Changes in v1:
- It is a complete rewrite to utilize the TEE subsystem.
- Link to RFC: https://lore.kernel.org/all/20240702-qcom-tee-object-and-ioctls-v1-0-633c3ddf57ee@quicinc.com

---
Amirreza Zarrabi (11):
      tee: allow a driver to allocate a tee_device without a pool
      tee: add close_context to TEE driver operation
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
      firmware: qcom: scm: add support for object invocation
      firmware: qcom: scm: remove unused arguments to the shm_brige
      firmware: qcom: tzmem: export shm_bridge create/delete
      tee: add Qualcomm TEE driver
      qcomtee: add primordial object
      qcomtee: enable TEE_IOC_SHM_ALLOC ioctl
      Documentation: tee: Add Qualcomm TEE driver

 Documentation/tee/index.rst              |   1 +
 Documentation/tee/qtee.rst               | 150 ++++++
 MAINTAINERS                              |   8 +
 drivers/firmware/qcom/qcom_scm.c         | 132 ++++-
 drivers/firmware/qcom/qcom_scm.h         |   7 +
 drivers/firmware/qcom/qcom_tzmem.c       |  57 ++-
 drivers/tee/Kconfig                      |   1 +
 drivers/tee/Makefile                     |   1 +
 drivers/tee/qcomtee/Kconfig              |  10 +
 drivers/tee/qcomtee/Makefile             |  11 +
 drivers/tee/qcomtee/async.c              | 160 ++++++
 drivers/tee/qcomtee/call.c               | 770 +++++++++++++++++++++++++++++
 drivers/tee/qcomtee/core.c               | 815 +++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/mem_obj.c            | 172 +++++++
 drivers/tee/qcomtee/primordial_obj.c     | 115 +++++
 drivers/tee/qcomtee/qcom_scm.c           |  38 ++
 drivers/tee/qcomtee/qcomtee_msg.h        | 239 +++++++++
 drivers/tee/qcomtee/qcomtee_private.h    | 264 ++++++++++
 drivers/tee/qcomtee/release.c            |  48 ++
 drivers/tee/qcomtee/shm.c                | 146 ++++++
 drivers/tee/qcomtee/user_obj.c           | 713 +++++++++++++++++++++++++++
 drivers/tee/tee_core.c                   | 127 ++++-
 drivers/tee/tee_private.h                |   6 -
 include/linux/firmware/qcom/qcom_scm.h   |  31 +-
 include/linux/firmware/qcom/qcom_tee.h   | 302 ++++++++++++
 include/linux/firmware/qcom/qcom_tzmem.h |  15 +
 include/linux/tee_core.h                 |  54 +-
 include/linux/tee_drv.h                  |  12 +
 include/uapi/linux/tee.h                 |  54 +-
 29 files changed, 4427 insertions(+), 32 deletions(-)
---
base-commit: 33035b665157558254b3c21c3f049fd728e72368
change-id: 20241202-qcom-tee-using-tee-ss-without-mem-obj-362c66340527

Best regards,
-- 
Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

