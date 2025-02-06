Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799831E98FC
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876035; cv=none; b=B/JwwvAwDF0sBZsZpX63mHgNGy7ZCCyHGgAdA+/xAaR64c9hCCd8UIY7wFVIwpS5SP6XdMTYiGf1RvgO3U4YNUyBQF+TdwW/GOfvDJ8uK9IsO5OPG6SrO5gSnIRZ+n/dNIfVf1WwIL8lkgxL2Ipgm0QADZorvCwy+1fq6Uk5A9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876035; c=relaxed/simple;
	bh=gmySyemTABWW/YZoDBas9z33BOa3vPcC6lWMoPCfpCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kowhY3ld6y1dxEb9z3ezCUVHWC6sXuwfayCMtMr7uCD1fWUj0DbsVk39eO5jONH0MYUVNSE30o+XnDGBHGXcVjudpD3LqneNPuwxcArfiIAKUKz/ccU7zf7cUm8QAYtHkLsSnm8gT1IPkfXLFepEg1AvQLJHmDmdJMChX6Y69oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TKnDg4VF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TKnDg4VF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738876032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YEZ7hyBGEACzUBMEkwH2aZgKLbVzZ6QD9bf9RTFVfH8=;
	b=TKnDg4VFK+hSle8AdiiUb4oEEDhn33Fl7mhIlTVTj5RV3h1FCyuJL3Qhfyh2Ddv6sVAf4+
	LPHQeY1zQBB5/MeEk2cyVqgs7KOU8G1qvlGcdNt2CZPl9WfZN5qs2ooOMgJ4ky4+nj7pER
	dFElxKUr1uv1YShrYPm31z+JMhqxZis=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-jgaIr-KKNtWhD9-lENmOpw-1; Thu,
 06 Feb 2025 16:07:08 -0500
X-MC-Unique: jgaIr-KKNtWhD9-lENmOpw-1
X-Mimecast-MFC-AGG-ID: jgaIr-KKNtWhD9-lENmOpw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 27EAA19560A7;
	Thu,  6 Feb 2025 21:07:06 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9914D1800265;
	Thu,  6 Feb 2025 21:07:02 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 06 Feb 2025 16:06:09 -0500
Subject: [PATCH 14/14] Documentation: Update the documentation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-mipi-cocci-v1-14-4ff0c69e8897@redhat.com>
References: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
In-Reply-To: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jianhua Lu <lujianhua000@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738875969; l=1462;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=gmySyemTABWW/YZoDBas9z33BOa3vPcC6lWMoPCfpCY=;
 b=nvJvm+ZuNAFGEA8RexRQqvhsRhVBEKzl7CNZQXUtDvJcEbAPrPZYJkqoVv5XasFGA8TxQezYF
 3eYfQVHasJcDIa21Uguiquio7g4Rw4anvaPQ1CsvhuiJAa9Ag7IHtCw
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

TODO addressed

Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 Documentation/gpu/todo.rst | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 256d0d1cb2164bd94f9b610a751b907834d96a21..16231355b3bd31e50c9b50c2c0006ec79ee4ca10 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -496,25 +496,6 @@ Contact: Douglas Anderson <dianders@chromium.org>
 
 Level: Intermediate
 
-Transition away from using mipi_dsi_*_write_seq()
--------------------------------------------------
-
-The macros mipi_dsi_generic_write_seq() and mipi_dsi_dcs_write_seq() are
-non-intuitive because, if there are errors, they return out of the *caller's*
-function. We should move all callers to use mipi_dsi_generic_write_seq_multi()
-and mipi_dsi_dcs_write_seq_multi() macros instead.
-
-Once all callers are transitioned, the macros and the functions that they call,
-mipi_dsi_generic_write_chatty() and mipi_dsi_dcs_write_buffer_chatty(), can
-probably be removed. Alternatively, if people feel like the _multi() variants
-are overkill for some use cases, we could keep the mipi_dsi_*_write_seq()
-variants but change them not to return out of the caller.
-
-Contact: Douglas Anderson <dianders@chromium.org>
-
-Level: Starter
-
-
 Core refactorings
 =================
 

-- 
2.47.0

