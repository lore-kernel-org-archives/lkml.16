Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6197C237702
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595578; cv=none; b=e4upu/WQGvuJRDDf5Fq7B+YebyJijnLMONDCkrxapXHcvsaROkpXxR0TcGU7a6iu6tILcWCXj1cI/o7X0eIrVW8LboOhg0d14QqtDyCFVh/CTimAs1S+LHo35/BmMqcZ8FvN4zBlwFgt+DxBK3I5CbxoFJQwczwfM8k/yNYxjt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595578; c=relaxed/simple;
	bh=/uTmJ9UsYWYEJS6myozRG/JY4Df0PtAl0v3aecAqDDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BBa8iFYou9tucHqjPOVihLtEBHbFbfUZMOd4CSgPCJ69j0z4k96HFzOIU0oVoeDuOnQUHVxhI/QH//VtE6jPesCEjzmJbAkrZMjFZh/ARImP/wMkTh92pj49FYs3txxWMDN2BS0DZF8U8xiPJi0swsxlTRO5EG9AYb0uOqDWvPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mvista.com; spf=pass smtp.mailfrom=mvista.com; dkim=pass (1024-bit key) header.d=mvista.com header.i=@mvista.com header.b=Z6WlDGmn; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mvista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mvista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mvista.com header.i=@mvista.com header.b="Z6WlDGmn"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2243803b776so65035595ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1743595576; x=1744200376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uTmJ9UsYWYEJS6myozRG/JY4Df0PtAl0v3aecAqDDQ=;
        b=Z6WlDGmn2k/VWb1EBVXZp+HZSPU7mZTRuGKgJ2faAgSVO4pujUZxuDaTq26dvsS+c+
         Pikcv5ka/wQKXlT6NyNg4p3lnpnqS4epDYv4xW28WbSbiAPXBIbuSDDQoNDSSY+faQpC
         +ZMUh3zbqz0w9VeX7bD7TBdsLDPbdaP+I4mJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743595576; x=1744200376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uTmJ9UsYWYEJS6myozRG/JY4Df0PtAl0v3aecAqDDQ=;
        b=WuriQLBCa6r0jZxO9i9DjBPgX7m/wB1DJTDENmJx9H0dZUphsb92GTc66/JqUwqvvo
         2e/An9/qpV8BI/mGpcjOR7EcSzhD3wUV/u+nEPyfC+yM2OhmSb2hJGZRRG7kB8CwxmQh
         jomJs8uLYOCaog+SAegbJzhofmsQ3dAjUEGjtP9KP2ckChCe/lrcEhQ/xBvWgBCafWhF
         0uqIAIhnXbX09Lq577lRXRv4IInQ24K31S0+deHxDSyuY9dR/WV4JB6nRbh8lgh44BvG
         CjJ+dTdbpQXd0yuTVOIWq675sq92GOtKhHb2P0VPJ0nTU3VoFsVP93SU3NeU+8ny2DpU
         7JNA==
X-Forwarded-Encrypted: i=1; AJvYcCUg9CmdNFgZ9Jfg5KbEnYwFTw2pgjzUi4+7emIz590zg7DWloo9wRbtQ7IdfrwGV9tZXuv5m8KMe1DyRv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTUbu1lzW89+cA81LZFWROt4BkmhOImpuPMKmIqOVRh+QA5R61
	npqr1KGfOcGIXQL362AsWQ015e5BwGdxMAnSTnxt0hbayxig2FTx+ZA/ZrQSrwU=
X-Gm-Gg: ASbGncuXhIaSQ814VzmfYst8/I0vZUcOIBKFNdZWAVK0GjQTm+esPxlSq+rzjtlzXNN
	z10TbHPgHA71iZ6oh5hp34C5jhctUIkzqunJuI+36+7QKPCZCUZNKzpCBqlMwEvxNhw+pIUe9WL
	YCuC2RCJvLy9YN5N2Q0jYQh25JpTDYX+6wG3HDAIC8GxFCujjrCNTM1MYU4FaWsfh2aNK0/Ekpq
	eqdKHLWviFKl+fVH6rqDs3cNnBTl/np1oh/KwbkW9rPzsOCBGa6pZktDsGzqbv4+XR4GMY6m17u
	NPM/HBlzUBR9QdgKPIDOtKzycWAE7qIOzS7dg/o4ExDDwbhPbvYWV+oSCe0=
X-Google-Smtp-Source: AGHT+IG64VGCl5I7155VMIOLlEDzBLsaOanZgQIzLZTNCCSEsbqCU6XYP90rg4jT/vHTLE8X1okjyw==
X-Received: by 2002:a17:902:ce08:b0:227:e74a:a057 with SMTP id d9443c01a7336-2296c879757mr33719785ad.44.1743595576545;
        Wed, 02 Apr 2025 05:06:16 -0700 (PDT)
Received: from niyas-desktop.mvista.com ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedd2bcsm106477375ad.65.2025.04.02.05.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:06:16 -0700 (PDT)
From: nmydeen@mvista.com
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cminyard@mvista.com
Subject: Re: Re: [PATCH] rtc-m41t62: kickstart ocillator upon failure 
Date: Wed,  2 Apr 2025 17:35:45 +0530
Message-Id: <20250402120546.336657-1-nmydeen@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401090454fb0ccf16@mail.local>
References: <20250401090454fb0ccf16@mail.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks, Hope it meets the expected

