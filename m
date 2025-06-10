Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777A62D5432
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749596351; cv=none; b=qaLChp43xLtnkvhdcvOKfeUR16BPhJLbpLT1o6AIXbbeOJbdNdx/xmOoy31WmmhC6FZHyflbnAr92Rq8H+Puh6M+WqqDmDXhGbCrDnRUpMuF/NzSuFpV2LaxdmOXI0YDSPHs+kNX0pZ9xrtn92EVgyBSqn8eDee1LVoZo/CVQ20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749596351; c=relaxed/simple;
	bh=f/VDHmbOT1oXljZqPn2oqb0nTFqkMhME3Nenhf3HdBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ieE+OuWSoHbSDx2HWzhBwf6VB76waKMlM1upW4M5QjLioHKWLnJWY744ElKv6WbkLU9JTW5Q5aDMjpQyRevTgCa6im2zHZ1mleVy6rsMup/Aa1ijNlpSgXScAhlTriw0ZBam8JSbLIkcktcWJKn8lcCdHE1DzJrWbC6fQHoLvYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=elijahs.space; spf=pass smtp.mailfrom=elijahs.space; dkim=pass (2048-bit key) header.d=elijahs.space header.i=@elijahs.space header.b=m5YFtmCM; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=epuefpiu; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=elijahs.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=elijahs.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=elijahs.space header.i=@elijahs.space header.b="m5YFtmCM";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="epuefpiu"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=m5YFtmCMo6bDCFO/4VZKWnNGL+7VnKs6+Bn0Bzi40VMndBTazErxROUeRcuYLosinpaJeRiWsjhwwVbZc2n6lEtoz43z/8jZCIzL/sefqcYDnczI/JVZSRHOhgQ62vC0bLMtqlgq6++HQROnPeZO1Hvq/9VbG4ZsGLFK/eCij47cOjQLYmMrGrEiJudNNreoLj2zO5MlOvZrwhqcMiz6FL83zsh+q7FT1mnf85G+lm/tL2nE5jw7qQoCeefI0RujYiZ6QwGeXXcz7eW54CbtY/SFCHIzcU2CeKnj52XuHdWv7M4uJ4Za3BOSYUskVZHj+cPaE3vhbkSD11DCdKOMSg==; s=purelymail2; d=elijahs.space; v=1; bh=f/VDHmbOT1oXljZqPn2oqb0nTFqkMhME3Nenhf3HdBA=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=epuefpiuIlOwbmcMSxEJaq5ynJ4zUSBPXM4jGOcfEzmtLxKDxyBcjwwYPP2mKCM6ga6XBILBReVWNFzMQp1dX+/cZVEvyC18hbBe4pIKSbsiNZYYX5Wxb1TOK7XMiwzwdfXrSCTvmZ/r2lLj6Wudnhvy1nLhsiqulmFlTPcxdVzHUgKli1RJeFTjEv05eCTaciJwlKlpxDw0+84+izwkhhs6vgN7yw1H0VUvTiJCUcBmSDylZsPql3c2F2kBLV2nVdfa+7i4dIdJGEQgWzD5i1oucTUKjmazrNw+MaTlfkZzG5v30xVBsJiKhSaBrycfoI440EwH3qHgadyEzk+T3w==; s=purelymail2; d=purelymail.com; v=1; bh=f/VDHmbOT1oXljZqPn2oqb0nTFqkMhME3Nenhf3HdBA=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 147366:4866:null:purelymail
X-Pm-Original-To: linux-kernel@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 235931968;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 10 Jun 2025 22:58:52 +0000 (UTC)
From: Elijah Wright <git@elijahs.space>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Cc: Elijah Wright <git@elijahs.space>
Subject: [PATCH] kernel: relay: use __GFP_ZERO in relay_alloc_buf
Date: Tue, 10 Jun 2025 15:56:28 -0700
Message-ID: <20250610225639.314970-3-git@elijahs.space>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

passing the __GFP_ZERO flag to alloc_page should result in less overhead th=
an using memset()

Signed-off-by: Elijah Wright <git@elijahs.space>
---
 kernel/relay.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/relay.c b/kernel/relay.c
index c0c93a04d4ce..3ee5b038d0d9 100644
--- a/kernel/relay.c
+++ b/kernel/relay.c
@@ -118,7 +118,7 @@ static void *relay_alloc_buf(struct rchan_buf *buf, siz=
e_t *size)
 =09=09return NULL;
=20
 =09for (i =3D 0; i < n_pages; i++) {
-=09=09buf->page_array[i] =3D alloc_page(GFP_KERNEL);
+=09=09buf->page_array[i] =3D alloc_page(GFP_KERNEL | __GFP_ZERO);
 =09=09if (unlikely(!buf->page_array[i]))
 =09=09=09goto depopulate;
 =09=09set_page_private(buf->page_array[i], (unsigned long)buf);
@@ -127,7 +127,6 @@ static void *relay_alloc_buf(struct rchan_buf *buf, siz=
e_t *size)
 =09if (!mem)
 =09=09goto depopulate;
=20
-=09memset(mem, 0, *size);
 =09buf->page_count =3D n_pages;
 =09return mem;
=20
--=20
2.43.0

