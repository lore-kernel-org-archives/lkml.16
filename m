Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F365D2FC3BF;
	Wed,  2 Jul 2025 20:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487274; cv=none; b=ChShHupEcEs46rkKtFwBkqX4NOCdaA2qjlL5g4lSwdzfh9X4ICNFuUSCIa/uuBylUrxu+3/CmkG8o0w5od1JdV5lvpAnCqrKAtTBjqZz/IgC9KAAJjqs5jiE46gwgYWOgG2sI71/3CYuN7iREMMRr6Tv+uSumG36UvvhIRK+ys4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487274; c=relaxed/simple;
	bh=zBWqLe/8w6jQy04hgGoAjOSCfh9MU/i5qTJrnQF83+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cmUYHRF9FDaQAaIbIJ1KqxQc4RvWMiw/U4snKH2eZ8+uOU+VwmDBQnq5LBAjIAxwyQE1NtIFbDzIhdyt/hMXlsPlghbL6KvmIZU1DDIZ2uR1CqehK1FEnXei6os3YGekhOT5wLK+VPzg9DZVHL9+tj861v3JhuJVm0bh1LnCpg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIU/Jg9h; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIU/Jg9h"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7086dcab64bso46245197b3.1;
        Wed, 02 Jul 2025 13:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751487272; x=1752092072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whp07KqijnEckNg3QoMixvcYpADgEZZkHKJXbQWF63Q=;
        b=fIU/Jg9hfpMDlyAGpyhIXRZ9ZkGk4E7WFoE2+d4gc1XwsLWk5UAnVn7CqBcw+DN4L5
         ivs1Cj4zkk4z4ILI+VpzOmwb76Pv3koVh0+OtCXSM5z/nzz+pPSzyqolZ2IFVso387Ch
         cTNGQFN6SenGeNNiTLa1QlyPJnLn8+/mJEo7kwhcwv/YvdPJMXzb9LUcSoAW4DoNyn6Q
         N6rXl/TRtsotUEarqXapss8N0WhVfFLdZLfxJyS7WSSvxzSUAGOvmJxRt7hpYWPQyJ1S
         bAH2/Qw8MhJLlSkfw8CtRJJe25Au5Nl+ivhILeI0jeb+DJxpAMKnbLOwwOgQNH088Op+
         XpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751487272; x=1752092072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whp07KqijnEckNg3QoMixvcYpADgEZZkHKJXbQWF63Q=;
        b=Uo/I6j1iBf36CCfbnRwoS7DEBhZ3kIYQ1FOoC7iwftWM5s0pTQD6wZHCBy2uQZ81QB
         AJuctZuYwaN8A12YZ2eP9aGZ13nC9hao6XKxU8TaxFgAz/xzXPivU0buU7zB5P5pcpei
         E+3MGglQ6U1n2XT8CdWGdwdBcWq14xzgV36vKeT8LpF/vlDXTBxvIFwY0p5vuTeJ19b3
         eX0lMeX5xFuQ+Rp5ZdfIshftG2IFEL++oEnx0ocAsC3Lo5YshSCyw6yYlSQXtfZ6CchF
         UuXb6vwaIfu1crl5/ACeFynKNKcyhxIjDt63WYRnRr1N69e/RBjcws8jA9P2SELicLSP
         fa7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUm31fw+jgAGCZHIJkphJI0+7BQeQpYAEiNipuTTOqNw6NwVsNGcyA8nnBEQ6WnpRfapmgUQqS40kQ=@vger.kernel.org, AJvYcCXpS9w/jBOY5Z1owZS3ETiwRuO9SV/JY8ECtofnIWRP4ZpzOJO+VXtTPlvpccaFJ3t26JVWLIyxLUJdfHrE@vger.kernel.org
X-Gm-Message-State: AOJu0Yye5BVrXOw5G0hH4Q2zjmGQd8/B0o7+YhbPqf1BJg5M7CDJgvcl
	JdqIJEy/5bcdJxHBss3ubyF04skXHYQ3C1rsvEvDDxtcYTuil5ZrPDar
X-Gm-Gg: ASbGncsFov6CAFhBcEKnpRy6XdsJTD3VBfM3c8c4+dngI5ipcOnMjnOKGxWA0CDmg5r
	cnJ6Cw5zla6915bNoIZmEBjqZ18mD0SCKACEcx0ND9FiS1IxK6RpOhpGqufUbnRms5gdtUTYcWK
	sLr7Gdj+9GWCR2viMAxRGxoshbeTn7znUGnQdlEZuszByHXDee8U6i8i4wt9QfYAM2SYhssKM0h
	tRSYJOtot6H18kZcN2ZjQgcJWbNzKRpunqTEOd3UydmIdsz+9AXr7OcDO6fXH/D6K6HwHSYhyNE
	VEmZH9oVCaV22B+/4wnEeXwwRdKxUPgVYSa+AgMIPCBw7IsSt5jGLFlafefK8temR0yR7/0GG92
	pW4EwDE2yFXQlseWMMw==
X-Google-Smtp-Source: AGHT+IGTS3C4MNCq+aw22xTnq01sw8nUASYU0w+f4Bsq2yNG7missxlZkISVB8+vcdsLs6QkRmv8xA==
X-Received: by 2002:a05:690c:6308:b0:711:41a5:482a with SMTP id 00721157ae682-7164d46a2d2mr64613437b3.27.1751487271759;
        Wed, 02 Jul 2025 13:14:31 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:873e:8f35:7cd8:3fe3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515cb4347sm26124157b3.83.2025.07.02.13.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:14:31 -0700 (PDT)
From: Bijan Tabatabai <bijan311@gmail.com>
To: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	joshua.hahnjy@gmail.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com
Subject: [RFC PATCH v3 06/13] Docs/admin-guide/mm/damon/usage: document dests directory
Date: Wed,  2 Jul 2025 15:13:29 -0500
Message-ID: <20250702201337.5780-7-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702201337.5780-1-bijan311@gmail.com>
References: <20250702201337.5780-1-bijan311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: SeongJae Park <sj@kernel.org>

Document the newly added DAMOS action destination directory of the DAMON
sysfs interface on the usage document.

Signed-off-by: SeongJae Park <sj@kernel.org>
---
 Documentation/admin-guide/mm/damon/usage.rst | 33 +++++++++++++++++---
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index d960aba72b82..fc5c962353ed 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -85,6 +85,8 @@ comma (",").
     │ │ │ │ │ │ │ :ref:`watermarks <sysfs_watermarks>`/metric,interval_us,high,mid,low
     │ │ │ │ │ │ │ :ref:`{core_,ops_,}filters <sysfs_filters>`/nr_filters
     │ │ │ │ │ │ │ │ 0/type,matching,allow,memcg_path,addr_start,addr_end,target_idx,min,max
+    │ │ │ │ │ │ │ :ref:`dests <damon_sysfs_dests>`/nr_dests
+    │ │ │ │ │ │ │ │ 0/id,weight
     │ │ │ │ │ │ │ :ref:`stats <sysfs_schemes_stats>`/nr_tried,sz_tried,nr_applied,sz_applied,sz_ops_filter_passed,qt_exceeds
     │ │ │ │ │ │ │ :ref:`tried_regions <sysfs_schemes_tried_regions>`/total_bytes
     │ │ │ │ │ │ │ │ 0/start,end,nr_accesses,age,sz_filter_passed
@@ -307,10 +309,10 @@ to ``N-1``.  Each directory represents each DAMON-based operation scheme.
 schemes/<N>/
 ------------
 
-In each scheme directory, seven directories (``access_pattern``, ``quotas``,
-``watermarks``, ``core_filters``, ``ops_filters``, ``filters``, ``stats``, and
-``tried_regions``) and three files (``action``, ``target_nid`` and
-``apply_interval``) exist.
+In each scheme directory, eight directories (``access_pattern``, ``quotas``,
+``watermarks``, ``core_filters``, ``ops_filters``, ``filters``, ``dests``,
+``stats``, and ``tried_regions``) and three files (``action``, ``target_nid``
+and ``apply_interval``) exist.
 
 The ``action`` file is for setting and getting the scheme's :ref:`action
 <damon_design_damos_action>`.  The keywords that can be written to and read
@@ -484,6 +486,29 @@ Refer to the :ref:`DAMOS filters design documentation
 of different ``allow`` works, when each of the filters are supported, and
 differences on stats.
 
+.. _damon_sysfs_dests:
+
+schemes/<N>/dests/
+------------------
+
+Directory for specifying the destinations of given DAMON-based operation
+scheme's action.  This directory is ignored if the action of the given scheme
+is not supporting multiple destinations.  Only ``DAMOS_MIGRATE_{HOT,COLD}``
+actions are supporting multiple destinations.
+
+In the beginning, the directory has only one file, ``nr_dests``.  Writing a
+number (``N``) to the file creates the number of child directories named ``0``
+to ``N-1``.  Each directory represents each action destination.
+
+Each destination directory contains two files, namely ``id`` and ``weight``.
+Users can write and read the identifier of the destination to ``id`` file.
+For ``DAMOS_MIGRATE_{HOT,COLD}`` actions, the migrate destination node's node
+id should be written to ``id`` file.  Users can write and read the weight of
+the destination among the given destinations to the ``weight`` file.  The
+weight can be an arbitrary integer.  When DAMOS apply the action to each entity
+of the memory region, it will select the destination of the action based on the
+relative weights of the destinations.
+
 .. _sysfs_schemes_stats:
 
 schemes/<N>/stats/
-- 
2.43.5

