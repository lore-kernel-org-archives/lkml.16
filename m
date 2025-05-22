Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0541426C
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747879006; cv=none; b=e+lTfsYI77nCJ49m/ZI038GF7kk3HAkXerNx9AGGjVULYhWChJGLRcroJEihQsHN0Fn+dATfjZsJy0aoC/b4VMQZHoKbWTh3A3AOsLl/KDdQ7Ts4Eb15R0kMPp/2GWYRmK5gqx9TYDYN/yDxGvpvkFs255DATEXBMPB+Zui9J14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747879006; c=relaxed/simple;
	bh=7iSzTdPviqOcWkq96vAkT5Q8IGZGjCWuUoYvMaw+Q0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFm3z/5ULjqwBBfYMjEapOBCi4CDeb0vhM+i5FqNRxa/mwtu8aDFZPMAA+NRSEAh2x9h9fcq8HbeXg8CvapkZLFHs+2xqTe8YK4SQXc3F+MSFgbkFvp/wMHLstzb92lYgwGys2AFCkLJWtO9fNCuANGW2Y6o0fU32eBrnVj0CGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UOoQJzhB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UOoQJzhB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747879003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7iSzTdPviqOcWkq96vAkT5Q8IGZGjCWuUoYvMaw+Q0k=;
	b=UOoQJzhBUlmzE7uPZp0i1cNb+ZTJCxQFxL++dZTXJ8LazbyVLyYNtUaH8B/MTJf4VzzqfD
	abYUuVQgZxdKdtPlDhwqudlttqFsNL8tHeKNV+1YaxvlWOCLq9eS+xKIRv5e9L26MdX0uk
	izYB0AYbL29+K6zwV2kKhoZHHLgiOhQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-mUzi-3EhPYi0LPx-BPKPTA-1; Wed, 21 May 2025 21:56:41 -0400
X-MC-Unique: mUzi-3EhPYi0LPx-BPKPTA-1
X-Mimecast-MFC-AGG-ID: mUzi-3EhPYi0LPx-BPKPTA_1747879001
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30e2bd11716so7491085a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 18:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747879001; x=1748483801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iSzTdPviqOcWkq96vAkT5Q8IGZGjCWuUoYvMaw+Q0k=;
        b=mf2faXjk4Lw2ePU2w6sFnD20c49mrNSDT/LjCOUSdZOopDK8CWnLJahu5S8pBEIwXI
         hbYDKIqoCv4TMZNIO0gDEQyJbCP33cJBFRMNsodqUxYtuL9vESY2exQs8R8Y5vU/nGvM
         R8jPFtaxoXn4vIIEjQPsCtzE7wEZ8dGFnEa/IcdQ+ePYO2X8BI9iND67WJFtFnVVaEP3
         PaowueLf3NR9j30XWuA22Mcctnpt4gcGoxaO/TJUS60wVZpCKnni9YqHVBWJISY9hezG
         nTe3Q7yzPxSM20wVt8G9z56y7uL4+U8fL+tmlsnhX9hZuIrkN8hGzDijbZ7i29dgs+Dl
         9CJQ==
X-Gm-Message-State: AOJu0YwPLV4zCO1074eOGeOGs3t6l25qIxjpRi2Dxta8OYmMEZC7ihJe
	mtdgR3GMke0P/1Dr+QgPaaJS5uQwdq6UFTFTd5OUbRbeS2u/T0xWhUW3OVcA2ooOph7IC/klyry
	KCgbB1v9oz1B41+HIdevNRbOlRlC5DNe0nrHCnv4gXE/5pvmoTk9zfH9MaPF5QlmCT8+SuHGd8B
	ZU+glMHImaydQbhHyep0OJNRMGKXTIZRhiCC/CJH00
X-Gm-Gg: ASbGncsnX/xhAipKoBIJ15Ki3uPnPIhWyxq2MleXI5b5sc4cnGvuBymQJma1XvjQxkd
	DOsSAbHqLvfhM0REOV98spY0aFXN/9U3kTKQESHjSlkarR/1K0HVDBKoZbBE1aReXmQLBVA==
X-Received: by 2002:a17:90b:1dc2:b0:2ee:693e:ed7a with SMTP id 98e67ed59e1d1-30e832357d7mr31898031a91.35.1747879000922;
        Wed, 21 May 2025 18:56:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+xjHR9j7Y1MuLT3juCqIfw7gluusaJrm5KctW8lhc+p1jVk5iqE7FgYDOPZA8CjL3zWh1fSepQECqqgncZH4=
X-Received: by 2002:a17:90b:1dc2:b0:2ee:693e:ed7a with SMTP id
 98e67ed59e1d1-30e832357d7mr31898002a91.35.1747879000576; Wed, 21 May 2025
 18:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521092236.661410-1-lvivier@redhat.com> <20250521092236.661410-3-lvivier@redhat.com>
In-Reply-To: <20250521092236.661410-3-lvivier@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 22 May 2025 09:56:29 +0800
X-Gm-Features: AX0GCFvVy4NeycSeo3DY5ADF1z6T0vmZbNBP-oJLc1oMWpnWxkEApN9hMXdB-50
Message-ID: <CACGkMEvknJzUf84GFLF2c9KGZ7r+6rNCYO4jyW4eb3+60oBPFw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] virtio_net: Cleanup '2+MAX_SKB_FRAGS'
To: Laurent Vivier <lvivier@redhat.com>
Cc: linux-kernel@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 5:22=E2=80=AFPM Laurent Vivier <lvivier@redhat.com>=
 wrote:
>
> Improve consistency by using everywhere it is needed
> 'MAX_SKB_FRAGS + 2' rather than '2+MAX_SKB_FRAGS' or
> '2 + MAX_SKB_FRAGS'.
>
> No functional change.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

