Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EE2145B25
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749606110; cv=none; b=CStkQXz37/V5d9zme9dgoRmerQJHsgTMlkL2J5rI5WOKlFC4r4pQJxBc12rA8SO1kanawbjaX3fF4q6hg+pk13uq6V4p8hnLd/qGCqs/7t40xuJUYAZ2pP65KZF5ViKh8Hb5AkxzGdXl6y+YwKz7wYxR0/WFGpTsk0HOnyViYrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749606110; c=relaxed/simple;
	bh=2kNFgJvFiHWl25tdl5JVTyWrVYRncCS6MCCO8o0uDrQ=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=l/kFrWEHw3eKAwiF3+vYtP/z4i1bClYXcIoOuZzhJtGSdO3wS0keqkqPfn+t+zIHSmu5Ye1voOljjwxLSl2ImY+6aHuFQWZ7UC5awhX/LjF8uaI/yLdeIY54lSiz/ZTZRZaAw8uF2TjedX1Px3AO6IBhYaReoHgqaTuRNYyW0W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ppZxc4ID; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ppZxc4ID"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a58f79d6e9so67331851cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749606106; x=1750210906; darn=vger.kernel.org;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a0dVcb4mCq2bSSy46KTU9Gw7pSw3OfMXBWad0p0FySA=;
        b=ppZxc4IDbRUpxdKr8t652woLHg1RyzQxv/RuyP2R96pEolTyaXs0QsjWTRDtS0/L5G
         OujhCqUreOIEu+tkuhuKLcWeWrUq4MWT2PpN1BTtqqcuJZypUUzGoCpAx4hQWFheEUaK
         r0QJBYGtGpYoywwBAzvMHAcVcZ9kHcjuI2MmdPVyf80JNxWQCQ6XDrI+cp5iFBOyzRB+
         +XkxuTeQD8vSJjouarr8do/Ne9GMBkEdnOYtZYZfBtcCHHqSrFo6XwDIlDuUfTkwzes4
         kUEn+eMpwvI1dwl13B2AmgxXt3LOXcaf7Jcasj+V4bD2OWkMtDEas86H3kCNVlq+I63n
         dbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749606106; x=1750210906;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0dVcb4mCq2bSSy46KTU9Gw7pSw3OfMXBWad0p0FySA=;
        b=Bt/8Ar5uVJ/22WPdqS8cPifP/8sff7j6BxkHArn37ZnB9aX4UDIcG3MjfO0WBPhr0B
         786ftCbcIb/VTt0oWmktFQ/kTdh+OMFnxZBQd4pRFivu6jE5Pt/3e+lZzWIuvMSFpVe8
         JLfvAIfXZCOV0L+pJh1FMCw6FotD7PvGxD5UGYabFQEGVeCpbGIeMjAHKNVZT+aBi8rV
         5ECWKlH8ywU0vNI7Pvdq8iK/NXprCQ62UwUng0rnUSXlCDMe0iSSQRF+YaIv1DgzAXVN
         /tkSh+ETmqyB3je4uo8YKWicsr8UxINBlB0+0Ue6uQIoqrIagCeYnApF3gC+4uwZUvf5
         Qzug==
X-Forwarded-Encrypted: i=1; AJvYcCVdK86Qa0lQiZ+WkKvMuuSpdvKU0YDNZEO8Jz0TH/DJQgaxmOHQ6jZnpOOjjdKidKAWhYLxWXq0l9xs12E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmPLYbPt01pJKLRIq3N+Ku0yr/aTEcHui1A+q0wlJyZF5fEOmy
	jZtxk+V3r6V80UfC2hLZkJOUPa9AdvHhCbntHxF4/C/ntElqGi5TQcJNUQRJJ1RuTxI=
X-Gm-Gg: ASbGncu927Gaee2+bGMh5pDPaGjco6sI1poQX0Lo3g7NTQXwMn/dPGp8PXtOQlFuq1F
	MrNsO+gPssujorSf6UQynlHfHFBdXhpFB1yWodwKLN4k07K9rlbM/LCW3/sIDyxrA2BiPw8qV5Q
	2xxzBmwW/l9EuIL8cxihvOIcrnOefircnubWPhqz/lRsXFL92Rdx3mddOK1ITeRJqLUx/gJ3Edx
	FMVdht8wAnsgvgM7Z+mbM4djdmqBhanwMLuurLSRUiGWsALy+Y/6/FBHzmG9mB1/tZExdfaQnyn
	buwvVqFsDnTxduCmpy8tK8iPeSxZunTszfH38lMKFrGon6Vp4x7Cga2pA+QBpzcgC5CUZMMR92I
	UuIHyZi0Xpav0Tp5fzPLOQAYi
X-Google-Smtp-Source: AGHT+IEQbrz7RwyiGN8V+7z64D4xdgmsviG8r/Zzdp8SlBm6YsYUWWHHm2ur+UN7w5AuSq1h89JPbA==
X-Received: by 2002:a05:622a:2287:b0:494:a36c:ebd7 with SMTP id d75a77b69052e-4a713c35ff8mr32647061cf.34.1749606105997;
        Tue, 10 Jun 2025 18:41:45 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a619865d36sm80410911cf.56.2025.06.10.18.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 18:41:45 -0700 (PDT)
Date: Tue, 10 Jun 2025 21:41:44 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] vt: add missing notification when switching back to text
 mode
Message-ID: <9o5ro928-0pp4-05rq-70p4-ro385n21n723@onlyvoer.pbz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Programs using poll() on /dev/vcsa to be notified when VT changes occur
were missing one case: the switch from gfx to text mode.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index ed39d9cb4432..62049ceb34de 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -4650,6 +4650,7 @@ void do_unblank_screen(int leaving_gfx)
 	set_palette(vc);
 	set_cursor(vc);
 	vt_event_post(VT_EVENT_UNBLANK, vc->vc_num, vc->vc_num);
+	notify_update(vc);
 }
 EXPORT_SYMBOL(do_unblank_screen);
 
