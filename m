Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C5E383
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 04:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743829083; cv=none; b=cDJLj3zI/JiBcTIbWxMQZpL1LmsGyKUu8ZUYqmUKQ4ETislxDDBvwnAZeyfoBblaTVo7j18u1qHFwHSXljOCfu2ngEgXgRNK5//OpFcM9cUOJ0tHxq1dFTHfq5nG2Jdf6BIvCCD9GGMd+1cd31paB8isoW1SkFHlt0M7xRfeUtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743829083; c=relaxed/simple;
	bh=I2stVIQnV1JMUDp1WceN/ExXStfJmwaVDIpVO4V2QNw=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TnB1Ey7xw1NyMlsPNekoGlIkJsSTI18bI3j3qp9JF1GKKeD4R3JXGA5BDGRm0ieQ6/gplLfV3EETiJYz9EEgLoY7hOJmUuZVnnAS5ixKLweqBj/BvUWK4y2wgPskMP1LEE4CvwwO85qPLUmzxRPz8lGzwTe3pSu32oGnkk3wnTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Wv8tljyn; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Wv8tljyn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1743829072; x=1744088272;
	bh=A2xev0rDxddos5NidDPQixrRYQvSFIIjKdpJyFe5F/U=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=Wv8tljynKiqeb4/qBvUPtzfbDTItGI6C17/B4h+L8cZqi1D9oC0y+9PU3u7pvgbF3
	 jpVYyVIY515dYEc0WNm5j1AjTWrt3QYbgg5MYxnvtZX7K0ZfAaCRA22S+kip44j4v5
	 lxKpRfnxVQ3zS6QM0FJfvwBDbTDz+mD4kPHoevM4vTnZeT2vc0lvA4A9xeIQF9KhK4
	 Jxi3QTL9pqYwIF7kBv5Omdbmvd9cA8U/cBrw8vb0hzxvTsTnvUZlK/d6JqSv0s/44o
	 xjMjfkhjKLFvvjTUiZgkBOMpluiDOaQ4mROb1Kk0/+LitFMSo2XVIcvcr40OsBLqQc
	 OLEs+zyQlDrog==
Date: Sat, 05 Apr 2025 04:57:48 +0000
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
From: "Michael C. Pratt" <mcpratt@pm.me>
Cc: Christian Lamparter <chunkeey@gmail.com>, =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, linux-kernel@vger.kernel.org, "Michael C . Pratt" <mcpratt@pm.me>, INAGAKI Hiroshi <musashino.open@gmail.com>
Subject: [PATCH v1 RESEND] nvmem: layouts: u-boot-env: remove crc32 endianness conversion
Message-ID: <20250405045617.26106-1-mcpratt@pm.me>
Feedback-ID: 27397442:user:proton
X-Pm-Message-ID: 55cbcd0545ede1fe5bb9544bdcfe6a873d5b7599
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11 Oct 2022, it was reported that the crc32 verification
of the u-boot environment failed only on big-endian systems
for the u-boot-env nvmem layout driver with the following error.

  Invalid calculated CRC32: 0x88cd6f09 (expected: 0x096fcd88)

This problem has been present since the driver was introduced,
and before it was made into a layout driver.

The suggested fix at the time was to use further endianness
conversion macros in order to have both the stored and calculated
crc32 values to compare always represented in the system's endianness.
This was not accepted due to sparse warnings
and some disagreement on how to handle the situation.
Later on in a newer revision of the patch, it was proposed to use
cpu_to_le32() for both values to compare instead of le32_to_cpu()
and store the values as __le32 type to remove compilation errors.

The necessity of this is based on the assumption that the use of crc32()
requires endianness conversion because the algorithm uses little-endian,
however, this does not prove to be the case and the issue is unrelated.

Upon inspecting the current kernel code,
there already is an existing use of le32_to_cpu() in this driver,
which suggests there already is special handling for big-endian systems,
however, it is big-endian systems that have the problem.

This, being the only functional difference between architectures
in the driver combined with the fact that the suggested fix
was to use the exact same endianness conversion for the values
brings up the possibility that it was not necessary to begin with,
as the same endianness conversion for two values expected to be the same
is expected to be equivalent to no conversion at all.

After inspecting the u-boot environment of devices of both endianness
and trying to remove the existing endianness conversion,
the problem is resolved in an equivalent way as the other suggested fixes.

Ultimately, it seems that u-boot is agnostic to endianness
at least for the purpose of environment variables.
In other words, u-boot reads and writes the stored crc32 value
with the same endianness that the crc32 value is calculated with
in whichever endianness a certain architecture runs on.

Therefore, the u-boot-env driver does not need to convert endianness.
Remove the usage of endianness macros in the u-boot-env driver,
and change the type of local variables to maintain the same return type.

If there is a special situation in the case of endianness,
it would be a corner case and should be handled by a unique "compatible".

Even though it is not necessary to use endianness conversion macros here,
it may be useful to use them in the future for consistent error printing.

Fixes: d5542923f200 ("nvmem: add driver handling U-Boot environment variabl=
es")
Reported-by: INAGAKI Hiroshi <musashino.open@gmail.com>
Link: https://lore.kernel.org/all/20221011024928.1807-1-musashino.open@gmai=
l.com
Signed-off-by: Michael C. Pratt <mcpratt@pm.me>
---
 drivers/nvmem/layouts/u-boot-env.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-b=
oot-env.c
index 731e6f4f12b2..21f6dcf905dd 100644
--- a/drivers/nvmem/layouts/u-boot-env.c
+++ b/drivers/nvmem/layouts/u-boot-env.c
@@ -92,7 +92,7 @@ int u_boot_env_parse(struct device *dev, struct nvmem_dev=
ice *nvmem,
 =09size_t crc32_data_offset;
 =09size_t crc32_data_len;
 =09size_t crc32_offset;
-=09__le32 *crc32_addr;
+=09uint32_t *crc32_addr;
 =09size_t data_offset;
 =09size_t data_len;
 =09size_t dev_size;
@@ -143,8 +143,8 @@ int u_boot_env_parse(struct device *dev, struct nvmem_d=
evice *nvmem,
 =09=09goto err_kfree;
 =09}
=20
-=09crc32_addr =3D (__le32 *)(buf + crc32_offset);
-=09crc32 =3D le32_to_cpu(*crc32_addr);
+=09crc32_addr =3D (uint32_t *)(buf + crc32_offset);
+=09crc32 =3D *crc32_addr;
 =09crc32_data_len =3D dev_size - crc32_data_offset;
 =09data_len =3D dev_size - data_offset;
=20

base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
--=20
2.30.2


