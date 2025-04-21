Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22082AF11
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745205959; cv=none; b=K21y/Meu2+7JhcCpLcAqC9pvuFh0LqqI5mzcoMiiux5PQG3jmhFgOdAAsS1Ht4nIIyG5M9Cw7IsUGLEIsVDm7aNGxnyuQU3d1+4w3lgjSlpi3he47x+FnrAeBWmTCCaSOJJ7YXs7uoyQCTp5BUiXMTNPx4wzCj1Lj/Dar9TYu3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745205959; c=relaxed/simple;
	bh=LDRqlt3pdVBe6W0Gqdk6DfxwzQkTyd2euV3LqI0Bh2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVyfQFXvVC2LiR1scCRm8s/jLJUdMGnnVeq4hJTwc0JhBwyMI0ydFyYc7S9Vq2oz3UVQTfVSvbZkistscs3PhGWs3dpK46L+2qumXRENh5l3lAMB11bSVOGDJ4p6d3q86WEHd07AxSJbNEIJt0DRwaK+VnxVbvVWnB6R+A9cvrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fzvYUJ5K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fzvYUJ5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745205955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LDRqlt3pdVBe6W0Gqdk6DfxwzQkTyd2euV3LqI0Bh2M=;
	b=fzvYUJ5KegdX4Hasas63Vum6d9W0OSFgX5N5/aNcWJ60XQcgBgEpG1NPJyn9E37243gUa8
	0EqdseaExa6YGGG0DHrMIXeFqBEMx55zrsG13sP9rkcGCIUAK6GGyH6AYFWGZAjymJVSXi
	A/M2THTUE2rxPYDzCOl3hmgm6nYvBAY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-s7dBSRiDOeKBUJZTFRfkJQ-1; Sun, 20 Apr 2025 23:25:54 -0400
X-MC-Unique: s7dBSRiDOeKBUJZTFRfkJQ-1
X-Mimecast-MFC-AGG-ID: s7dBSRiDOeKBUJZTFRfkJQ_1745205953
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30828f9af10so8090568a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 20:25:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745205953; x=1745810753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDRqlt3pdVBe6W0Gqdk6DfxwzQkTyd2euV3LqI0Bh2M=;
        b=XXY4GXb5jD8KWGqyO2/wmyoWN30TKjEKc4/YhuQEx6u3ecG0LLDYCZifE47LJqRfKg
         D5DvUY31zhhIRYAazDZYatWfN1w0bVeRP77viTY2AFphwPB4CUMAPNPsDDp+Rq5kFKU/
         D8Z/TYXlri6pk2EPsBn4JDJW/20CSnUx+keTlNtvlKZQpYAhul1pROhdmk2xXVLNJUEJ
         xR36k3TgXzf8vVlenRXxT2XklGlwgtgyOopxdLCvE/TDyYNJGBbdma/pMWyI5rMY/apZ
         kAtTO3RRc+MJ324rGys08JyzoSg395YQ5JyczJDoD4feLKI+wI7I90L5PMBHtJC3p9OH
         UN4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwCKHmpOo9OySthPw0TmrhM8Ig0jD43KALRMlQkbuElCNyDUjCLBx0WAs12j2ClohwAqZ68wF0HQGPAkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcwAG2hL2LxmkaesOlyjgHhxQyu12hZhqWHGUwkiGyO+kYl15D
	xT/2vfxqIJXCawUwR+j66SJaj7PSBpOzxcFNOJ8ufAN8V7aeQencgE5ZYctpOgo7ScPcvaNwbXZ
	QhOsQnjs4g3tHkuUQk3RTCOGvVos28ehEMRyZR6HSU7TaRKGo1qLNpNJUiRoCKoiG49n/6P+fCP
	EIJxNsPnBRZMQbqlfPMYwXXZcmvoqBGHo6kI3W2oMq+esHS6g=
X-Gm-Gg: ASbGnct++181QNgn6sKnj/dfFpQldICx8boxlidm5wn7521OW9Yu5CF0OuPpEsLD9AQ
	kM1QUW+/92IjaUTVkxN58DNQhIRDGe0P+N0HVvFB8NDV6+ee6dyEasdbVjb1JYCDQdWPWnA==
X-Received: by 2002:a17:90b:4d0e:b0:2ff:72f8:3708 with SMTP id 98e67ed59e1d1-3087bb698dbmr16031396a91.17.1745205953161;
        Sun, 20 Apr 2025 20:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRn4aaJLEWKifGdZtxb0xG0ZX1rnp7AGSHkwS8cLatxxEFkRFOLg4s2lSpvKjRkSSHI3FJP0BYoc1g+518R0k=
X-Received: by 2002:a17:90b:4d0e:b0:2ff:72f8:3708 with SMTP id
 98e67ed59e1d1-3087bb698dbmr16031376a91.17.1745205952711; Sun, 20 Apr 2025
 20:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421024457.112163-1-lulu@redhat.com> <20250421024457.112163-2-lulu@redhat.com>
In-Reply-To: <20250421024457.112163-2-lulu@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 21 Apr 2025 11:25:40 +0800
X-Gm-Features: ATxdqUEzFhmXZvex8E_M5MI68rpAe_dfLzO2jQT5TrbK-mfz02wSE_-vO-a54DE
Message-ID: <CACGkMEsR-t1j3d3Hh7FkHDWrjCRoyB17JxCwiN8Fqkh-zJiyVw@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] vhost: Add a new parameter in vhost_dev to allow
 user select kthread
To: Cindy Lu <lulu@redhat.com>
Cc: mst@redhat.com, michael.christie@oracle.com, sgarzare@redhat.com, 
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 10:45=E2=80=AFAM Cindy Lu <lulu@redhat.com> wrote:
>
> The vhost now uses vhost_task and workers as a child of the owner thread.
> While this aligns with containerization principles, it confuses some
> legacy userspace applications, therefore, we are reintroducing kthread
> API support.
>
> Introduce a new parameter to enable users to choose between kthread and
> task mode.
>
> By default, this parameter is set to true, so the default behavior
> remains unchanged by this patch.
>
> Signed-off-by: Cindy Lu <lulu@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

