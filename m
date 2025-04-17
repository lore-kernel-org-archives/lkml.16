Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C188A1B4153
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 19:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744917002; cv=none; b=Ou19EaRY770DuREtFzLdX92+y1qqOxCnHEDbPxCexWYTpe22kV4TIEGeMlps32zwWeT4gTOtAKJjpvLJOnY3eN3hnPviUPIgCp2zxEYVRveRhPbeR6NmL0V9Ndk7rwUDMvHPwa6YzKV/2iiNeDTXRP03Vjt2+EQO+z0xlDPrcT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744917002; c=relaxed/simple;
	bh=LWmtqcRg4vYqaht95rNzQTnZG5rXeJkgUB16GqPuT78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TnWvkrQ6+BLehFQeC3YUTFFlyNX4c6H99S8YBxBQLIHmebjz2hKMvTFDFvyziOYtW5liOzmfHcQB+JNfkTIPtpNuOFfEF3eM5uRtkbGpiqXuIy/arWEhZ93Q/Ah9OsV0Bd1dpRFjZr6gQJciVj1JkzjHmcSO/0goZoM/DdghEZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f/6ZUIR1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f/6ZUIR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744916999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uiXBTi+9xPzAQerymXjoaS4kjOTzAaU4VV7kSHRN7Dc=;
	b=f/6ZUIR1qYMFAMLE+UoNzb6CJG2Mn/0bPw76vMClyq4cUSRQuEUkJlrfn6a0V7Tcw5aOk0
	EGjlt6F+Un9j2NuqzOb7yjps9EYSc62aoHSjuYYJHva5d7uI07fi2rycsgdiaDqmSnXKvA
	1cy95Alyk9tg2AN8IdF5KKWLKgOmeWI=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-QUT5HyS9M2ODmwYhY2iUsQ-1; Thu, 17 Apr 2025 15:09:58 -0400
X-MC-Unique: QUT5HyS9M2ODmwYhY2iUsQ-1
X-Mimecast-MFC-AGG-ID: QUT5HyS9M2ODmwYhY2iUsQ_1744916997
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-8617c4a3d0dso12588639f.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744916997; x=1745521797;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uiXBTi+9xPzAQerymXjoaS4kjOTzAaU4VV7kSHRN7Dc=;
        b=TSYt3UVUljGISBY6Psg1CzVfQ4jzllKQrqTHWV5akOPOVHnbIAZqdJ9mPJvi/Bnktg
         Ml6/ORxRmq1p7l1O8nYc0WANsB/xscxyIE3vfFBUjIzMHTjo0szNwxKS5PJenH4iVl8t
         KoRwAfI5JivoHumQGr89mCWH4R4EoUcr+Ir6R67HwuTOFD4rmV/3amrUK+/X+l5T8pL3
         z3shHxEWYuJusm79M6W5OCiXLuAfC/7HgwDZ9PIH7B78sNR5B72CL++yY6Dc8UBzlJlx
         Bvfla2IHKNPriOD9Z5lQUDl+4kdb9CGEF4E76yZCOsYFZM9LGXzQtHxVdmeikvLDbrL0
         xxew==
X-Gm-Message-State: AOJu0YzG2NYFgheqqiZlDz1bAbR/LdKMNMqAoWbyI76yrQi2pHXn8lWv
	n8a5L2gY8qYd40E3TpKBXwB3wlx2A7RZ4YKBaJXxHzvNglIDaOq+b4K61qxcz4tv+u3TAgr29ff
	uCFQjMi/cFul4jG5in+LoK5oWHfm+8EV1RpUXyGjvxKI3LbYI9PEEiDgff9DL3ivcldY8pg==
X-Gm-Gg: ASbGncvA4j14UylX4O9C7Xk4DFnXlm7N0hOqu9u/buduNMuZ/nituEaraTl5uE1FfZD
	mYGxLUqll5zBZegHbBUuHa7h/h51ZXEuWDrvuqo3jshjldxnaiZrp6h7C68DO4Cz+f9fOhoAvZj
	jEamDh4hbibNBtyQsL8CCVeuir/dd5S+rPwYaw7RRtwzs1ptKjZHY1rtp0sYyuCw6ICDTlTo1XZ
	7zXNoY52moOb5xCn9fdEKR4uP6LIzdOX/oWqSPb2ekgskR5VNWGdLhAWuuM8AHnniA2SfAhG7VB
	4ydtjH+YJrPT168=
X-Received: by 2002:a05:6602:2cd2:b0:85b:3f28:ff99 with SMTP id ca18e2360f4ac-861cc459a02mr167212839f.2.1744916996977;
        Thu, 17 Apr 2025 12:09:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxg3eT3tsXsVwuUelrtMA5J4sp1U5X0esmywejNrIGOo8PKOizFgbB/HiQRLWrl593n5mp7A==
X-Received: by 2002:a05:6602:2cd2:b0:85b:3f28:ff99 with SMTP id ca18e2360f4ac-861cc459a02mr167212239f.2.1744916996658;
        Thu, 17 Apr 2025 12:09:56 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-861d95de8bcsm6563339f.4.2025.04.17.12.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 12:09:55 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:09:52 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, sbhat@linux.ibm.com
Subject: [GIT PULL] VFIO update for v6.15-rc3
Message-ID: <20250417130952.52761ea6.alex.williamson@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

A small addendum to 860be250fc32 ("vfio/pci: Handle INTx IRQ_NOTCONNECTED")
that should also make it into v6.15.  Thanks,

Alex

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  https://github.com/awilliam/linux-vfio.git tags/vfio-v6.15-rc3

for you to fetch changes up to 2bd42b03ab6b04dde1753bd6b38eeca5c70f3941:

  vfio/pci: Virtualize zero INTx PIN if no pdev->irq (2025-04-14 08:31:45 -0600)

----------------------------------------------------------------
VFIO update for v6.15-rc3

 - Include devices where the platform indicates PCI INTx is not routed
   by setting pdev->irq to zero in the expanded virtualization of the
   PCI pin register.  This provides consistency in the INFO and
   SET_IRQS ioctls. (Alex Williamson)

----------------------------------------------------------------
Alex Williamson (1):
      vfio/pci: Virtualize zero INTx PIN if no pdev->irq

 drivers/vfio/pci/vfio_pci_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

