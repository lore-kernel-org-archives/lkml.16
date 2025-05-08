Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19ED252917
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714022; cv=none; b=Yk6bqdPdNcgCzl9sJQjTqIvaOV0DFOjnBPLpoeyKVivUZtz5NzeJGcKViRIC4XimM8yr426o5JwnTHCh7fT0KCX2xPMwYqSUSe52UFBa7RVh323TVzfiDu1g70JEjaoK0RSFLehFrxWoq8AVbMxeNp5+Fr6LbXFzzC7n/41Awfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714022; c=relaxed/simple;
	bh=wThSVBwzmoJLTfHkfr41NVmaasgxmNoL/bVIkHKdo/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QeA0Dfzh9EHXKvAeCqQ+qxjav2CrfAXIkvWjFD8HBd5bVMscXdqY9sm7e1D6VkILc869zJvn/o8Z9gX2pLjJf/lb2JCmpQmJZPnq3QbtTQICl11StxgIBAt6d8aS0+sCw3bsGtn2GGQiXs1yFDDPXVufCD8YteQlBAILBHRFFcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bqgn8BW+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bqgn8BW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746714019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1KcuC1xrFnlcJ1MsHim/31AFnZb3C+RZr0o19KYuHuI=;
	b=bqgn8BW+r+Eqx5D6y/coF7qbXvAxn9gKwpWfQ+fBdk6sSq6DxWu6RJ7QDKKpcdRqdjQkyV
	1YjUHZU2YjWHHBk7vyrDg7zGKnxaRosh9MQo71l39Lo9JeCs7RrTm8ctRKL0FwrfuHkHJC
	p52B5ajqO9gBaWWnMb5Rhbs0tAJ28X8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-5do2M8nfNyeWLLXdy4huCA-1; Thu, 08 May 2025 10:20:18 -0400
X-MC-Unique: 5do2M8nfNyeWLLXdy4huCA-1
X-Mimecast-MFC-AGG-ID: 5do2M8nfNyeWLLXdy4huCA_1746714017
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acbbb0009aeso88418066b.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714017; x=1747318817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1KcuC1xrFnlcJ1MsHim/31AFnZb3C+RZr0o19KYuHuI=;
        b=wGxzQl2HEAxRKXxI9nGP8oOG1kP7jLPQ1Nz83PTWJm9gELyxaMftYgx65+/SEeXWuc
         iE7PxJNwXPkWhr5iCEoT5Do43UfqOym4C6v0OwYJxcT2l0DBdLmvX8IUKTpZ0/92nDMB
         /JLmoYhsP3VBE2BhcTyltxOwxeDB2f0eJf1qlXbj6SmzH862+X4TZ5ufAI+yPwYqSynF
         sEFZb/Geaf3RpLn7cF5f3QGLo7dk4vvWJssRsMw/xxZ6H2sH8+myTbL68WmtvpujRkER
         9u55lKx1lywo/Srkctt/wE2ZTrRKrkGw+nK6xZZYGmSfEvfRBYlPygdwMUwzVrZmYN6M
         +tFQ==
X-Gm-Message-State: AOJu0Yx6ld0/TM4WLFoYI0l1boUZ5p6o8KVK4TB8xDLCe1+9sbjwuNgt
	5dAMT1gUOeM+L0UT1WpWUurXcAdEpPmJRKpL4c9iPnfO9OYfEn9X1i7f+O/Jcaox4IBUeFFgNwa
	lH4nArscoitF6WrHXJuCodk78mGCQbuaG/XzcAnvgBiRT8LLSUr2dWcXr8hGLZA==
X-Gm-Gg: ASbGncunpHHF5W1G6LdfEUvJcKGLz2QxcIERzMBrX2qfEu6CmFj5PHo6jMxFe8YgdBY
	EAfl/qdU2uNujkK0ngxWd0LZBUbxqAsW5pmNg/e6upT0VyVnfiN92+l1SPiDOOi4MW5tg2xr6jS
	O9uv52FGBfKUuuZRRvVxvX3KnrLxnj6Z4o/HMwY+mCVrcjWLZUm/vlUY4DrYEFfubO2pG3+oLYi
	LfA5W9kUOTzIaDFeIsXINDT94W+alU1l/wazX6by11OYUADthhAtHwVIdjH4p3VLRV2Fay1pjH/
	/mO1zul1k6Gi4vw8hquOBAqcWw==
X-Received: by 2002:a17:906:a088:b0:ad2:e08:ea00 with SMTP id a640c23a62f3a-ad20e08f24bmr92964966b.9.1746714017413;
        Thu, 08 May 2025 07:20:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF/hUx02Zz2WoX+JCoxsMrV4CfxurR8vP/WKpaYlG35vY287928sPfk+pmToqAmT2lRFVVTA==
X-Received: by 2002:a17:906:a088:b0:ad2:e08:ea00 with SMTP id a640c23a62f3a-ad20e08f24bmr92961466b.9.1746714016846;
        Thu, 08 May 2025 07:20:16 -0700 (PDT)
Received: from localhost.localdomain ([193.207.221.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a1e60sm1089667366b.47.2025.05.08.07.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:20:15 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	virtualization@lists.linux.dev
Subject: [PATCH net-next 0/2] vsock/test: improve sigpipe test reliability
Date: Thu,  8 May 2025 16:20:03 +0200
Message-ID: <20250508142005.135857-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running the tests continuously I noticed that sometimes the sigpipe
test would fail due to a race between the control message of the test
and the vsock transport messages.

While I was at it I also improved the test by checking the errno we
expect.

Stefano Garzarella (2):
  vsock/test: retry send() to avoid occasional failure in sigpipe test
  vsock/test: check also expected errno on sigpipe test

 tools/testing/vsock/vsock_test.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

-- 
2.49.0

