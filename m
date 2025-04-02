Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787431EBA07
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615746; cv=none; b=m6UfWHtoj+LJ8Jp89T4wzh7OWQFPoLtrNMgBZjs+0wHTDcOwIc/ofZrRH/iUZO6R8AauC+xorumtqu+AxVJuB0r53M57GvgoAMJQslXZFMQaMSe/vAEKuL7965QtycJ6Ps6e8SZW1Td8SBe6uMzkz6E5bNGVu7y/qIHGEitWIKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615746; c=relaxed/simple;
	bh=0iDZDFcFxJGYvKq3+HBGQfkJx820bwme1JTm7/klx/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OrzoTBpCBSDOngd7NinmiDeql6sLxxGZ+Khj6Etp/Sg9hnwIt5DLpZbPW8oImPsyYHYUEvwbZLFcmAqiHiO/7PAJrismwwqNe+5kknQYyhuXXs99+x2iKPCy6cG/18EiWquGlyNNGOZs+4dx2G74FNWZEdWVw8yjU/t+d6tvsLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZQ3NrBp; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZQ3NrBp"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-85de3e8d0adso680639f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743615743; x=1744220543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvjbELtWnV/6RRAeJjKQ44+/OjVwNVd4yFNXgDDBNwA=;
        b=AZQ3NrBpvGHxV0KfJDoH2lrWQ81Vw2A8JjyrJNN/kIvSXQ90gUYTvWGq5pCtSKoqkm
         5hx7xDKq3RGD3j2Mvh0f6MmUlfeYLboIFONWQ1FCApLgzEzOvI2VzVwl0HTs1mtDwZf+
         vsb/EhTaJbjimK9ASMqFeVNv/PzrWhmBi6D3290oHDgiuXVX6YXzyxsqPDLbQVf3GLtG
         rxlq0WDnEM8fPOSOo5UUh1k6Bi9/B74n1dG6PD3nx7mZ+F/aUYtr5jFJWa9DrgffhkiS
         FKYlO3O3LXisqEyfLWNv48g4ImlMYKjwIGg5GxqGYS22P5tCe2kyI7FzRIOdxpMhvnxb
         CZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615743; x=1744220543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvjbELtWnV/6RRAeJjKQ44+/OjVwNVd4yFNXgDDBNwA=;
        b=szVueMGNW9EsrYQvZnj5YA/trW1iQEUAvMAx5X7oR3y7S0N6L6BUCrC58LF6YV2xJc
         B7uDuouThm/g0a+YgGE/p/TEDGfrL8+SL3PvSg825diBM6kadVAeXbmINtr0Ju2TDaYz
         qWTWZqY7Z93kcchgGO/A+xjgQyIr7V7RL/aDhhZ+XFAarTGaL37BDWMfHYSOeeuVdmQS
         60iOGaUQvvOh9tVtEoxDxLLGsxZDjLcVbv0hK8vmff9O5ANi/AqqI9zN7b9g7ien49KU
         9JNIXfaFe6QlEOSARMNLklD3OQG1bTH8iSeb3/jEKXpfZJl3qx6docZzFsiKBjNnn2w7
         Qk7A==
X-Forwarded-Encrypted: i=1; AJvYcCWOX1Ri+ArZXrqPoXTUrWHFPt/5A/1+QTXdQrR8P7jRwctdqX1OBSz8JH2ek6Ivth5A6S1Y1kIHCwg0pJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4tQ8LbNMhMSs3Dn+Nk70G71GHXiqQpfr0SNjPtftwJ36agmqB
	ICf8jHQzyrpxM3Zomoxk/yZQtzBnF+4XVm8BMLUDthpTBmZFlXtC
X-Gm-Gg: ASbGnct6jGhln1QVr5TvCsgB/eeRpPF+2hkRq+JCh/ZZgS4Rilp/dsGQ46eH+W1WoTJ
	m5/PhEOt1FKiHR8+InR2AUSIAKL/2OdQdQIt0vuEGbhi1AXoZ++toXIJ9pCWRIYFaIFgZRirV1M
	7bfkBRg4iNw9Sjr2cFNvlHbnIB9RwEamF3iqO7lz8wrM12Rxm0mwMj6ijBy/TE9Xk0+GKRiNFmx
	m3CNizk8ny/+0hW/uQAGTQRXIVgfa0nHREhWRoUPlYiCUQp7waI1kQmJwb/UR3nOyNEhkcLKYuj
	lqVApz43dJP0cM0wtiQbbulCZA4V7DGt1AeUjcv3DfIWNSNswvDKVFHxUW250HtSp8fR3TDr26l
	u2Q==
X-Google-Smtp-Source: AGHT+IGs85dZsLuENhKJMhd+4RgG2Mp0KjLcFlPdCM0oKKyQhvn0ta0pOjzD/VWsfZGf5qORX7r3hg==
X-Received: by 2002:a05:6e02:1b0c:b0:3d6:d3f7:8826 with SMTP id e9e14a558f8ab-3d6d3f7c548mr56059025ab.20.1743615743459;
        Wed, 02 Apr 2025 10:42:23 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:42:23 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com,
	linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 10/54] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Date: Wed,  2 Apr 2025 11:41:12 -0600
Message-ID: <20250402174156.1246171-11-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

old_bits arg is currently a pointer to the input bits, but this could
allow inadvertent changes to the input by the fn.  Disallow this.
And constify new_bits while here.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/dynamic_debug.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 3ad2e38c9ae2..621e04b1f28c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -595,7 +595,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -604,12 +605,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	if (*new_bits != *old_bits)
+	if (*new_bits != old_bits)
 		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
-			  *old_bits, query_modname ?: "'*'");
+			  old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
-		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
+		if (test_bit(bi, new_bits) == test_bit(bi, &old_bits))
 			continue;
 
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
@@ -621,9 +622,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
-	if (*new_bits != *old_bits)
+	if (*new_bits != old_bits)
 		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
-			  *old_bits, query_modname ?: "'*'");
+			  old_bits, query_modname ?: "'*'");
 
 	return matches;
 }
@@ -679,7 +680,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -689,7 +690,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -743,7 +744,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -756,7 +757,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
-- 
2.49.0

