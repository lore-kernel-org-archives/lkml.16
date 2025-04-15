Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7AD250BEC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 20:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744748089; cv=none; b=uM5kHaljTElS3QY8syShAL+NYpYQeASedkfbiiOn5wvqNhLWwz4SwcdTS2bP3drsyv4mPd5ERAPzufZ4sNRS6dJetXZ4CmYvjkxDQjWTg41OfXdg4q6Vrju+xGqJwf7260IJd1nDQ2qrhLvxe2npJmWkpKCph5rwcOlQCUSkFpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744748089; c=relaxed/simple;
	bh=QrX5BfBQF2U/SMXR4SwmyIo877XUcxmuZpNerm61EBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dMrV1KShqbchISSHr8Xf2On5cn5PMNDwx2j+qDbx+OonIIFBK0tnOGeRzHx8BWMIt8QGHXPjz18D/21KUzMpe+uMh5RxrxH266dPdF6vk4vLDg2k0wbDgdabyMEVE2uWZurF+RzR1ufCVALC1q78NpsXgj9puvRkTNr7QM7qhyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jNIsvbHw; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jNIsvbHw"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54298ec925bso5173558e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744748086; x=1745352886; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrX5BfBQF2U/SMXR4SwmyIo877XUcxmuZpNerm61EBw=;
        b=jNIsvbHwjuNecxt9sfUqWRrXZHZVY9H/TmkKKOfrPtKT/W+PrmYegcQ7QFbd2llSBq
         Di0EVYgI3dGgYP9khNeK8KA/qFyAQcb+FBfBzfU0Qqgnq/16vxmxueNFdhMJr2Jr917e
         Bn7wpcFltZaezumbPf/kkjDd0I6brq/+EVGM2/uV2LEwAuFm0cwjt0oEhXsibQeQLWez
         CiOYTi2xlJ34y33YaEHQHynSnT18/bSvYaLoNMwHPJjNR9nkjChmaUoRpe1ZHZuW2a45
         p2ONqVarokSbYodd4b2DliuwCUoZ579F0uJcT5USqlx5lX2T5kVQztD1UPzRwQi9mTS5
         d5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744748086; x=1745352886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrX5BfBQF2U/SMXR4SwmyIo877XUcxmuZpNerm61EBw=;
        b=SK9S2eP9lFA6qPyLA5atxSF3Of0vOU+0mYbEUcTDbWJRMVf+xgFl4IsWVyKy+BweY1
         xpZVl0DtKxK8Cwpsmu//7oXcBSENGVOlEIP9ZR6+x7OkxOKYtPgbsQfsEydNYCZb6xqm
         fCTX191/fGjsfDlt5mazik+UzhobSSxQlbOsPG7lrwxx6+Z5UQ2zN9TMVmAz6j+SOaeS
         uSr6jOv0gZLOKYP7iCNO7ZYsrOnpqwWkNH8tNhFx8+3gYe7ti7xCub5fbGqv8pVEWbSN
         6+ErCwqOtKUY3eN9CKmWNMXdDIZ2JPZqz+Nu9wDATwxUrTZlxfuX1LQ5CblfXFI3kOrJ
         cf+A==
X-Forwarded-Encrypted: i=1; AJvYcCUW8lr7Yt4+Mw5XALrjW5AqMxBX7RfySBOnL2pgaA1hbnZESVoOWy5poUK1AqEBn6st/8E3o0ymNt9YCzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDim89WlrAC5hpve0Sv0nf5wS/Yds6Zpy5y69PbLsPz46qijO+
	76XLbS65IwpcaYc79s9UWbaK481sd7/cSj1EjRYRE+KZ3TT/foCNVMcp/gU8p7M2FK0xjcwt7Oe
	G3FFq2C78eZKf18xxHWcCNLMd5nfPl2p2zz4=
X-Gm-Gg: ASbGnctRkzNNdsxz1vIgkerbIu+m3vg+qhoh8ITZh/zENQw3GNnl2WRQPRNvCg4s6ce
	gfcOsiDG0iA4H4MMv9HRDeGbD3x22wqqYZ7cxzlLzaslzUiqo1CHZHRdvK8FXngEXOl1dvS+gl7
	Tp1AG8LqjfIx2Oq4HYBCQCyW25fQdEBDKhNFQUg3LLG49Dxni5wzo=
X-Google-Smtp-Source: AGHT+IFmjn22DVWrD3J6egNzsPL6Ng3PyVECAR9T97KHvP2G77xLiJ5TWGIYssFAbUDv+TSvWv030sUAs71yMgQvDH8=
X-Received: by 2002:a05:6512:3e17:b0:549:733b:6afc with SMTP id
 2adb3069b0e04-54d604ccf4cmr100825e87.12.1744748085535; Tue, 15 Apr 2025
 13:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250415171954.3970818-1-jyescas@google.com>
In-Reply-To: <20250415171954.3970818-1-jyescas@google.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 15 Apr 2025 13:14:32 -0700
X-Gm-Features: ATxdqUG4dYOEgBpq3vBJFjWe22Y7nhXg-DziqAyeOFw0AhrMx6YFrW0nd6Oh9O8
Message-ID: <CANDhNCpK86yKWTUkXV5oK6n7gTmeNDn-NsDppBjObXPEMwD44g@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: heaps: Set allocation orders for larger page sizes
To: Juan Yescas <jyescas@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	"T.J. Mercier" <tjmercier@google.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	baohua@kernel.org, dmitry.osipenko@collabora.com, jaewon31.kim@samsung.com, 
	Guangming.Cao@mediatek.com, surenb@google.com, kaleshsingh@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 10:20=E2=80=AFAM Juan Yescas <jyescas@google.com> w=
rote:
>
> This change sets the allocation orders for the different page sizes
> (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
> for large page sizes were calculated incorrectly, this caused system
> heap to allocate from 2% to 4% more memory on 16KiB page size kernels.
>
> This change was tested on 4k/16k page size kernels.
>
> Signed-off-by: Juan Yescas <jyescas@google.com>

Seems reasonable to me.
Acked-by: John Stultz <jstultz@google.com>

thanks
-john
