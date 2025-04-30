Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AFB21129C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746046809; cv=none; b=BgHZ+9P66aBHQ9i+TN9nD6qJ+4PjTplnkayShtafiU6lZqj0uJFCjEpcHchHaglwNHgxwWdNTqUIBUQtpvY+9hOmNLfVdVBDYTU7tvPMgArMlA4HeQSDM8R10V4+2B+SShOwV2JtKO9Vr04fZqSdpT/GDrQ/TPT4D7bs7Mgy5YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746046809; c=relaxed/simple;
	bh=/CuIfaYDCNqPTcXokhTuRlg4AoowI+APXoNmgKWktH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qwVyoePTbAo4BcvVXWf/4QQHu0hfRER8KT3WM0/lYk3OUlyP4EEK4E8mS8lCuU841xDlvM9qEQU5ywqIdSbRpLPxNyloyr1UdCNZItqfeZBoV0GDuPuUXEKIB9talQzThILpv3oaSJU+Dk52cspU2elGGlOb0gtXdH9ux+p4JUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SPSn1MM8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SPSn1MM8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746046805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=te0JzSyQ3UVvPFmW88xb/x+Rt04AbyStUxtiIlYnPhs=;
	b=SPSn1MM87zvUqG2bcZ3NYNx7PZkwjs3r5PaveJotLQ6aVpZe8CcQ0hv/O99pPUOlKnHu3l
	HEae5BVa3rg6z0TdR4aLwYMX+g8mrgyXT0VJ85PRH9bWnE7RPvPkUPlQ6DaOkblYc5zHND
	bGTkVxxN6CGIN2VFoFdONvCCOOBuzJ0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-414-v862ffphM1S1k4xU2smhsA-1; Wed,
 30 Apr 2025 17:00:01 -0400
X-MC-Unique: v862ffphM1S1k4xU2smhsA-1
X-Mimecast-MFC-AGG-ID: v862ffphM1S1k4xU2smhsA_1746046800
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E45401800875;
	Wed, 30 Apr 2025 20:59:59 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.88.112])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B377E1800871;
	Wed, 30 Apr 2025 20:59:58 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: catalin.marinas@arm.com
Cc: lcapitulino@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	david@redhat.com
Subject: [PATCH 0/3] mm: kmemleak: small cleanup
Date: Wed, 30 Apr 2025 16:59:44 -0400
Message-ID: <cover.1746046744.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Hi,

This is a trivial mm/kmemleak.c cleanup. I found these while reading through
the code.

Luiz Capitulino (3):
  mm: kmemleak: drop kmemleak_warning variable
  mm: kmemleak: drop wrong comment
  mm: kmemleak: mark variables as __read_mostly

 mm/kmemleak.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

-- 
2.49.0

