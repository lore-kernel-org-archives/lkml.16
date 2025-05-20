Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F6925D207
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747725618; cv=none; b=hKUEL8chix7v8dNNfc/xswdJoqEvvr5AO1m9QyoZP/2TK6F4++cXGtfrIDHxRWXMQWVRTPxhhvm31AH1Q58W4XZZUKN1PrqVuWY16mFufL1aN95zK99A+9WNulmrr8Ok4KYvAPKmE1sSFhP8SDuQA83jSjZAFW4Z4QS1N3vQjj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747725618; c=relaxed/simple;
	bh=cP7Qsu978JdO14VIy+ZgrNiEsOq8tQhEus1xNAKU9xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XB/VF3XbOqOXA5pS5PCmfUjXJO5lXZeuzd8NllYa7KgPbWJBVQVed7CDwQ/eFA2+MnrtdYXSSPBJ/A7AwVLzjNncUDGcPlcq2u6DD5lENVz3dkXOXZCzvx/q4ZB31Gvfcp9KlpA9Lkgql6DSYQGDCfntndsXGw0S/WNw7Cmf2oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N9Eddo7I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N9Eddo7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747725615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fQTn3idRl0VQlk8k3SIRDqs4SeWLMUWz5azl60Juisk=;
	b=N9Eddo7I/cGoqOPVB3cxF4W9Opnmq4ih8S1BbtHcA2UW5W4f6Eu6WE0ACn3rsQN5VhWrW8
	qaaG6CfZ6GYR+Nx8v/hs/2wAI0sNyyOSCWZhBs8P5EkEXRQ9Bm/ar6CtwESsWPB+e9OlS4
	n8oHpGjR9W4Rf0AY7GsqGTKzcWaEb+Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-iiudzvIYPUOysECUoRiTeQ-1; Tue, 20 May 2025 03:20:12 -0400
X-MC-Unique: iiudzvIYPUOysECUoRiTeQ-1
X-Mimecast-MFC-AGG-ID: iiudzvIYPUOysECUoRiTeQ_1747725611
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a364394fa8so1560964f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 00:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747725611; x=1748330411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQTn3idRl0VQlk8k3SIRDqs4SeWLMUWz5azl60Juisk=;
        b=Z/Ealtk99IQ7ptnHf/B45mROEqA8JD7GoIIoKhaynYnoH8UNv15BO/lFGkDu50ekK5
         0LckbKuL9MVdlrJlRXbniUE2yfl8eDyfyOQDnCQNFIZRXlDVZ2Cuw36oXL6jh/Ba2o7k
         dXBEg9xTi5IHljWS2Y5nqdCyAc27TsKgBqKfayiZhqEkmHADym8w4e7PPYGtqek1QLm/
         zJcGOBbN0+EdsqSYUxTRr+YJKpSGv6csd2kMugoHv1vfqpgcXehZuoFqX87SonTwVc+o
         W7A6weG8oo7KZkqp+uA1X5i+a6Pt4xg2CIOCGnEXCXLg+nI5zYjo9yrn1nRQo/l2WwTb
         3tFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa9kKCNw5tm8h/DyX7C4aRaW6JDpaTP976mYGOWYCho/ASlQ+8b3zmBZPYlJLbWqT36NY/0BHuaOSOq70=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5l24PAGHyxbewC6SknuFxl3lxizAigRo7ynL3VOSRUwOK2SJ5
	cdQ9DUlk3RqEHuH05NPC6Memh+ipq8ShR80aPXloCjydyxaafvRB7Fzvqe4LJoa8KfrcdeO5Xe2
	RjN8QEzXrWeZ82AepD69dHSEaRQ6AReCUcT2L0zfZpMsykeA7UqbOkrfGjsoTiW3t5Q==
X-Gm-Gg: ASbGnculgdZIjFFThwMh0si+d2wdvKcEpOCT6Tt/ypWYdlIy+YtQk6G9PQj2BEdrkRj
	WNVzmlXCpqAgaqs6/FEXwRyALyOrmrB0EzH6SSNnXiXrtC5u0g3CzI2YxYxoaZHuAEDE6WvDAhl
	JzJcDn+k4paDtsWd85bW6L4AAoyNjBR6+SMMrmXG2mQN7nTPs9F/DM9yIudnPQjBfYbDXkI/3Q6
	VjAD/yhVYQafDGVl7vcP5XFTGsJfWV8SABygjT7zr86nuxsT4WZ/dD9klow3Ov16BLH/ZPJF2ty
	qd/NFOVkNNh9NF43NFVEfjJG/fCLOwVSHpI/kslmVLIAbyN144rtpJci22CO
X-Received: by 2002:a05:6000:2384:b0:3a1:f684:39a7 with SMTP id ffacd0b85a97d-3a35fde361amr11701763f8f.0.1747725611060;
        Tue, 20 May 2025 00:20:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMxpZctuxlPRTxO/eDif5ZtBRMhbiuIwkMb+0+eYZU8wMz06n9FB1hYZCoVHkP5hJIZwrLuA==
X-Received: by 2002:a05:6000:2384:b0:3a1:f684:39a7 with SMTP id ffacd0b85a97d-3a35fde361amr11701718f8f.0.1747725610479;
        Tue, 20 May 2025 00:20:10 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-35.retail.telecomitalia.it. [82.53.134.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef01besm19228605e9.10.2025.05.20.00.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 00:20:09 -0700 (PDT)
Date: Tue, 20 May 2025 09:20:04 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, James Clark <james.clark@linaro.org>, 
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Clark Williams <williams@redhat.com>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 1/7] tools include UAPI: Sync linux/vhost.h with the
 kernel sources
Message-ID: <cek234mjuzbh3w4jvwhpx2oundb23tmxjaa2q35ul7bu7todum@hqkjcbnf3fzf>
References: <20250519214126.1652491-1-acme@kernel.org>
 <20250519214126.1652491-2-acme@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250519214126.1652491-2-acme@kernel.org>

On Mon, May 19, 2025 at 06:41:20PM -0300, Arnaldo Carvalho de Melo wrote:
>From: Arnaldo Carvalho de Melo <acme@redhat.com>
>
>To get the changes in:
>
>  a940e0a685575424 ("vhost: fix VHOST_*_OWNER documentation")
>
>That just changed lines in comments
>
>This addresses this perf build warning:
>
>  Warning: Kernel ABI header differences:
>    diff -u tools/perf/trace/beauty/include/uapi/linux/vhost.h include/uapi/linux/vhost.h
>
>Please see tools/include/uapi/README for further details.
>
>Cc: Adrian Hunter <adrian.hunter@intel.com>
>Cc: Ian Rogers <irogers@google.com>
>Cc: James Clark <james.clark@linaro.org>
>Cc: Jiri Olsa <jolsa@kernel.org>
>Cc: Kan Liang <kan.liang@linux.intel.com>
>Cc: Michael S. Tsirkin <mst@redhat.com>
>Cc: Namhyung Kim <namhyung@kernel.org>
>Cc: Stefano Garzarella <sgarzare@redhat.com>
>Link: https://lore.kernel.org/r/
>Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
>---
> tools/perf/trace/beauty/include/uapi/linux/vhost.h | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/tools/perf/trace/beauty/include/uapi/linux/vhost.h b/tools/perf/trace/beauty/include/uapi/linux/vhost.h
>index b95dd84eef2db231..d4b3e2ae1314d1fc 100644
>--- a/tools/perf/trace/beauty/include/uapi/linux/vhost.h
>+++ b/tools/perf/trace/beauty/include/uapi/linux/vhost.h
>@@ -28,10 +28,10 @@
>
> /* Set current process as the (exclusive) owner of this file descriptor.  This
>  * must be called before any other vhost command.  Further calls to
>- * VHOST_OWNER_SET fail until VHOST_OWNER_RESET is called. */
>+ * VHOST_SET_OWNER fail until VHOST_RESET_OWNER is called. */
> #define VHOST_SET_OWNER _IO(VHOST_VIRTIO, 0x01)
> /* Give up ownership, and reset the device to default values.
>- * Allows subsequent call to VHOST_OWNER_SET to succeed. */
>+ * Allows subsequent call to VHOST_SET_OWNER to succeed. */
> #define VHOST_RESET_OWNER _IO(VHOST_VIRTIO, 0x02)
>
> /* Set up/modify memory layout */
>-- 
>2.49.0
>

