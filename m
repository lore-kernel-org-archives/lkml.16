Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AB5217F32
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014852; cv=none; b=lWDdUuMBTMVwaKT5P/BtJzrVoZ9x0Y/lvDDZCWm3a/WBzASn0cqG3SD3dwMIE+GDHn7/5GgOxAzRos1m+HKd6OWBgUj7lj5LHsijaJ49Dzbyc59XrSpW1qLOhxFmp0C1gSI6MQeaUjBTjcoW8iAzYrwNDZn4cim8PCQbKnF3+CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014852; c=relaxed/simple;
	bh=m/TaOChonZ35mMesQTACEd12fQdLgAjVQLkMrkfFWuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gZbDF086sTZFMMSYOc899/hMLWdOPRSCSXzmesNu82nj+8w59b4gtHmvjI731wFFeF2VIKLDzpJeHBZpqVm5TjCdVko7JzLV7MgP1WqjxvXxNzkRWIepLahl22ucQgkYvEDkKZr20aUYyoeredoUhKGED7PEdxErR3vbncrd0Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6cWTHmw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6cWTHmw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78DE3C4CEDD;
	Mon,  7 Apr 2025 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744014851;
	bh=m/TaOChonZ35mMesQTACEd12fQdLgAjVQLkMrkfFWuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c6cWTHmw7f5XXfltKBE1jrGo1cNC8PSjkk2XvPWeG/EBvlfRoITRizDQrLDYP7jfW
	 xdZNKF3h4AATXCPhOBXORzamzvaswh/w5Ue+MKPeLwtwb19WGFQ70MafvErw77VP5j
	 2J3n5a8KlHo9c4UiAgG8BcU8tfQoFbFRa22ewRkwKWl+jyo+JGNgfmTou/Tptkk3xi
	 /1Hz3NYNi09JsqjvUxafUNPEkJ0qp1tmup1aV21LKQE/bYxPiq5e24zdRbfQKhKaF5
	 HAkEK1z+0ovGjxDjyuISMPcgvNGsD3fClcwVW++2TsHYTnFZYXRIpwjZzA+m9tTXW/
	 v2gfsICJUlgog==
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Joel Selvaraj <jo@jsfamily.in>,
	Douglas Anderson <dianders@chromium.org>,
	Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] drm/panel: Use refcounted allocation in place of devm_kzalloc()
Date: Mon,  7 Apr 2025 10:34:06 +0200
Message-ID: <174401483592.120970.11262671520967808365.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 01 Apr 2025 12:03:43 -0400, Anusha Srivatsa wrote:
> Start converting drivers to use the API - devm_drm_panel_alloc().
> 
> This series addresses only 10 drivers. There are 98 more to go. Sending this
> series to mostly get feedback. if any change is required, it will be
> incorporated in the next version and in the next series that will
> address the remaining drivers.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
